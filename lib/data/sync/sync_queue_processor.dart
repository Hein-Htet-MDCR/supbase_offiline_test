import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase_offiline_test/core/remote/supabase_config.dart';
import 'package:supbase_offiline_test/data/models/mappers.dart';
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
    // Listen for network connectivity changes and attempt queue sync automatically
    connectivity.onConnectivityChanged.listen((results) {
      if (results.any((result) => result != ConnectivityResult.none)) {
        processQueue();
      }
    });
  }

  /// Processes queued offline operations sequentially (FIFO)
  Future<void> processQueue() async {
    if (_isProcessing) return;

    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.every((r) => r == ConnectivityResult.none)) {
      return; // Offline; abort sync process
    }

    final userId = SupabaseConfig.currentUserId;
    if (userId == null) return; // User must be authenticated to sync

    _isProcessing = true;

    try {
      final pendingQueue =
          await (db.select(db.syncQueueTable)
                ..where((t) => t.retryCount.isSmallerThanValue(maxRetryCount))
                ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
              .get();

      for (final item in pendingQueue) {
        // Enforce exponential backoff delay for items that failed previously
        if (item.retryCount > 0 && !_shouldRetryNow(item)) {
          continue;
        }

        final bool success = await _processQueueItem(item, userId);
        if (!success) {
          // Stop processing subsequent items to preserve operational order integrity
          break;
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  bool _shouldRetryNow(SyncQueueTableData item) {
    // Exponential backoff: 2^retryCount * 5 seconds (5s, 10s, 20s, 40s, 80s)
    final backoffSeconds = pow(2, item.retryCount) * 5;
    final nextRetryTime = item.createdAt.add(
      Duration(seconds: backoffSeconds.toInt()),
    );
    return DateTime.now().isAfter(nextRetryTime);
  }

  Future<bool> _processQueueItem(SyncQueueTableData item, String userId) async {
    try {
      final Map<String, dynamic> payload = jsonDecode(item.payload);
      payload['user_id'] = userId; // Ensure strictly bound user ID

      switch (item.entityType) {
        case 'user_vocabulary_progress':
          await _syncUserVocabularyProgress(payload);
          break;
        case 'vocabulary':
          await _syncVocabulary(item.operation, item.entityId, payload);
          break;
        case 'quiz_result':
          await _syncQuizResult(item.operation, payload);
          break;
        case 'user_streak':
          await _syncUserStreak(payload);
          break;
        default:
          throw UnimplementedError('Unknown entity type: ${item.entityType}');
      }

      // Sync successful: Remove from Sync Queue and update local state to synced
      await (db.delete(
        db.syncQueueTable,
      )..where((t) => t.id.equals(item.id))).go();
      await _markEntitySynced(item.entityType, item.entityId);
      return true;
    } on PostgrestException catch (e) {
      // Handle Conflict (Last-Write-Wins / Remote Conflict Resolution)
      if (e.code == '23505' || e.code == 'P0001') {
        await _resolveConflict(item, userId);
        return true;
      }
      await _recordFailure(item, e.message);
      return false;
    } catch (e) {
      await _recordFailure(item, e.toString());
      return false;
    }
  }

  Future<void> _syncUserVocabularyProgress(Map<String, dynamic> payload) async {
    await supabase
        .from('user_vocabulary_progress')
        .upsert(payload, onConflict: 'user_id, vocabulary_id');
  }

  Future<void> _syncVocabulary(
    String operation,
    String entityId,
    Map<String, dynamic> payload,
  ) async {
    if (operation == 'DELETE') {
      await supabase.from('vocabularies').delete().eq('id', entityId);
    } else {
      await supabase.from('vocabularies').upsert(payload);
    }
  }

  Future<void> _syncQuizResult(
    String operation,
    Map<String, dynamic> payload,
  ) async {
    await supabase.from('quiz_results').upsert(payload);
  }

  Future<void> _syncUserStreak(Map<String, dynamic> payload) async {
    await supabase.from('user_streaks').upsert(payload);
  }

  /// Conflict handling: Pull remote state and apply Last-Write-Wins based on timestamp
  Future<void> _resolveConflict(SyncQueueTableData item, String userId) async {
    Map<String, dynamic>? remoteData;

    if (item.entityType == 'user_vocabulary_progress') {
      remoteData = await supabase
          .from('user_vocabulary_progress')
          .select()
          .eq('vocabulary_id', item.entityId)
          .eq('user_id', userId)
          .maybeSingle();
    } else {
      remoteData = await supabase
          .from(item.entityType)
          .select()
          .eq('id', item.entityId)
          .maybeSingle();
    }

    if (remoteData != null) {
      final remoteUpdatedAt = DateTime.parse(remoteData['updated_at']);
      final payload = jsonDecode(item.payload);
      final localUpdatedAt = DateTime.parse(payload['updated_at']);

      if (remoteUpdatedAt.isAfter(localUpdatedAt)) {
        // Remote is newer: Overwrite local database with remote state
        if (item.entityType == 'user_vocabulary_progress') {
          await (db.update(
            db.vocabularyTable,
          )..where((t) => t.id.equals(item.entityId))).write(
            VocabularyTableCompanion(
              isFavorite: Value(remoteData['is_favorite'] ?? false),
              isLearned: Value(remoteData['is_learned'] ?? false),
              updatedAt: Value(remoteUpdatedAt),
              isSynced: const Value(true),
            ),
          );
        } else if (item.entityType == 'vocabulary') {
          await db
              .into(db.vocabularyTable)
              .insertOnConflictUpdate(VocabularyMapper.fromJson(remoteData));
        }
      } else {
        // Local is newer: Force overwrite remote
        if (item.entityType == 'user_vocabulary_progress') {
          await _syncUserVocabularyProgress(payload);
        } else {
          await supabase.from(item.entityType).upsert(payload);
        }
      }
    }

    // Clear queue entry after resolution
    await (db.delete(
      db.syncQueueTable,
    )..where((t) => t.id.equals(item.id))).go();
    await _markEntitySynced(item.entityType, item.entityId);
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

  Future<void> _markEntitySynced(String entityType, String entityId) async {
    if (entityType == 'vocabulary' ||
        entityType == 'user_vocabulary_progress') {
      await (db.update(db.vocabularyTable)..where((t) => t.id.equals(entityId)))
          .write(const VocabularyTableCompanion(isSynced: Value(true)));
    }
  }
}
