import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase_offiline_test/core/remote/supabase_config.dart';
import '../local/app_database.dart';

class SyncQueueProcessor {
  final AppDatabase db;
  final SupabaseClient supabase;
  final Connectivity connectivity;

  bool _isProcessing = false;
  static const int maxRetryCount = 5;

  SyncQueueProcessor({
    required this.db,
    required this.supabase,
    required this.connectivity,
  }) {
    connectivity.onConnectivityChanged.listen((results) {
      if (results.any((result) => result != ConnectivityResult.none)) {
        processQueue();
      }
    });
  }

  Future<void> processQueue() async {
    if (_isProcessing) return;

    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.every((r) => r == ConnectivityResult.none)) return;

    final userId = SupabaseConfig.currentUserId;
    if (userId == null) return;

    _isProcessing = true;

    try {
      final pendingQueue =
          await (db.select(db.syncQueueTable)
                ..where((t) => t.retryCount.isSmallerThanValue(maxRetryCount))
                ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
              .get();

      if (pendingQueue.isEmpty) return;

      // 1. Group queue items by entity type
      final Map<String, List<SyncQueueTableData>> groupedItems = {};
      for (final item in pendingQueue) {
        groupedItems.putIfAbsent(item.entityType, () => []).add(item);
      }

      // 2. Execute batch processor for each entity group
      for (final entry in groupedItems.entries) {
        final entityType = entry.key;
        final items = entry.value;

        switch (entityType) {
          case 'user_vocabulary_progress':
            await _batchSyncUserProgress(items, userId);
            break;
          case 'vocabulary':
            await _batchSyncVocabularies(items, userId);
            break;
          case 'quiz_result':
            await _batchSyncQuizResults(items, userId);
            break;
          case 'user_streak':
            await _batchSyncUserStreaks(items, userId);
            break;
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  // ===========================================================================
  // BATCH HANDLERS
  // ===========================================================================

  /// Batch sync for user_vocabulary_progress (Composite key: user_id, vocabulary_id)
  Future<void> _batchSyncUserProgress(
    List<SyncQueueTableData> items,
    String userId,
  ) async {
    final Map<String, Map<String, dynamic>> latestPayloads = {};
    final List<String> vocabIds = [];
    final List<int> queueIdsToDelete = [];

    for (final item in items) {
      queueIdsToDelete.add(item.id);
      final payload = jsonDecode(item.payload) as Map<String, dynamic>;
      payload['user_id'] = userId;

      final vocabId = payload['vocabulary_id'] as String;
      if (!vocabIds.contains(vocabId)) vocabIds.add(vocabId);

      latestPayloads[vocabId] = payload;
    }

    try {
      await supabase
          .from('user_vocabulary_progress')
          .upsert(
            latestPayloads.values.toList(),
            onConflict: 'user_id, vocabulary_id',
          );

      await db.transaction(() async {
        await (db.delete(
          db.syncQueueTable,
        )..where((t) => t.id.isIn(queueIdsToDelete))).go();
        await (db.update(db.vocabularyTable)..where((t) => t.id.isIn(vocabIds)))
            .write(const VocabularyTableCompanion(isSynced: Value(true)));
      });
    } catch (e) {
      for (final item in items) {
        await _recordFailure(item, e.toString());
      }
    }
  }

  /// Batch sync for custom vocabularies (Primary key: id)
  Future<void> _batchSyncVocabularies(
    List<SyncQueueTableData> items,
    String userId,
  ) async {
    final Map<String, Map<String, dynamic>> upsertPayloads = {};
    final List<String> deleteIds = [];
    final List<String> syncedIds = [];
    final List<int> queueIdsToDelete = [];

    for (final item in items) {
      queueIdsToDelete.add(item.id);
      final payload = jsonDecode(item.payload) as Map<String, dynamic>;
      payload['user_id'] = userId;

      if (item.operation == 'DELETE') {
        deleteIds.add(item.entityId);
        upsertPayloads.remove(item.entityId);
      } else {
        upsertPayloads[item.entityId] = payload;
        syncedIds.add(item.entityId);
      }
    }

    try {
      // 1. Batch delete operations
      if (deleteIds.isNotEmpty) {
        await supabase
            .from('vocabularies')
            .delete()
            .filter('id', 'in', deleteIds);
      }

      // 2. Batch upsert operations
      if (upsertPayloads.isNotEmpty) {
        await supabase
            .from('vocabularies')
            .upsert(upsertPayloads.values.toList(), onConflict: 'id');
      }

      await db.transaction(() async {
        await (db.delete(
          db.syncQueueTable,
        )..where((t) => t.id.isIn(queueIdsToDelete))).go();
        if (syncedIds.isNotEmpty) {
          await (db.update(db.vocabularyTable)
                ..where((t) => t.id.isIn(syncedIds)))
              .write(const VocabularyTableCompanion(isSynced: Value(true)));
        }
      });
    } catch (e) {
      for (final item in items) {
        await _recordFailure(item, e.toString());
      }
    }
  }

  /// Batch sync for quiz_results (Primary key: id)
  Future<void> _batchSyncQuizResults(
    List<SyncQueueTableData> items,
    String userId,
  ) async {
    final Map<String, Map<String, dynamic>> latestPayloads = {};
    final List<int> queueIdsToDelete = [];

    for (final item in items) {
      queueIdsToDelete.add(item.id);
      final payload = jsonDecode(item.payload) as Map<String, dynamic>;
      payload['user_id'] = userId;

      latestPayloads[item.entityId] = payload;
    }

    try {
      await supabase
          .from('quiz_results')
          .upsert(latestPayloads.values.toList(), onConflict: 'id');

      await (db.delete(
        db.syncQueueTable,
      )..where((t) => t.id.isIn(queueIdsToDelete))).go();
    } catch (e) {
      for (final item in items) {
        await _recordFailure(item, e.toString());
      }
    }
  }

  /// Batch sync for user_streaks (Primary key: user_id)
  Future<void> _batchSyncUserStreaks(
    List<SyncQueueTableData> items,
    String userId,
  ) async {
    // Only the single latest streak payload needs to be uploaded per user
    final lastItem = items.last;
    final payload = jsonDecode(lastItem.payload) as Map<String, dynamic>;
    payload['user_id'] = userId;

    final List<int> queueIdsToDelete = items.map((i) => i.id).toList();

    try {
      await supabase
          .from('user_streaks')
          .upsert(payload, onConflict: 'user_id');

      await (db.delete(
        db.syncQueueTable,
      )..where((t) => t.id.isIn(queueIdsToDelete))).go();
    } catch (e) {
      for (final item in items) {
        await _recordFailure(item, e.toString());
      }
    }
  }

  Future<void> _recordFailure(SyncQueueTableData item, String error) async {
    await (db.update(
      db.syncQueueTable,
    )..where((t) => t.id.equals(item.id))).write(
      SyncQueueTableCompanion(
        retryCount: Value(item.retryCount + 1),
        lastError: Value(error),
      ),
    );
  }
}
