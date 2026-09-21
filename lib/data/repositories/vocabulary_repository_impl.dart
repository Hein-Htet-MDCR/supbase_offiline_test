import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase_offiline_test/core/remote/supabase_config.dart';
import '../local/app_database.dart';
import '../models/mappers.dart';
import '../sync/sync_queue_processor.dart';

abstract class VocabularyRepository {
  Stream<List<VocabularyTableData>> watchVocabularies();
  Future<void> toggleFavorite(String id, bool isFavorite);
  Future<void> markAsLearned(String id, bool isLearned);
  Future<void> fetchRemoteVocabularies();
}

class VocabularyRepositoryImpl implements VocabularyRepository {
  final AppDatabase db;
  final SupabaseClient supabase;
  final SyncQueueProcessor syncProcessor;

  VocabularyRepositoryImpl({
    required this.db,
    required this.supabase,
    required this.syncProcessor,
  });

  /// Reactive stream for UI widgets (watches local Drift SQLite database)
  @override
  Stream<List<VocabularyTableData>> watchVocabularies() {
    return (db.select(db.vocabularyTable)..orderBy([
          (t) => OrderingTerm(expression: t.word, mode: OrderingMode.asc),
        ]))
        .watch();
  }

  /// Optimistic Local Update -> Queue Progress Mutation -> Async Sync
  @override
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    final now = DateTime.now();

    // 1. Local database update
    await (db.update(db.vocabularyTable)..where((t) => t.id.equals(id))).write(
      VocabularyTableCompanion(
        isFavorite: Value(isFavorite),
        updatedAt: Value(now),
        isSynced: const Value(false),
      ),
    );

    // 2. Fetch updated item to get current learned state
    final updatedItem = await (db.select(
      db.vocabularyTable,
    )..where((t) => t.id.equals(id))).getSingle();

    final userId = SupabaseConfig.currentUserId ?? '';

    // 3. Stage entry targeting user_vocabulary_progress instead of master vocabulary
    final payload = {
      'user_id': userId,
      'vocabulary_id': id,
      'is_favorite': isFavorite,
      'is_learned': updatedItem.isLearned,
      'updated_at': now.toIso8601String(),
    };

    await db
        .into(db.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entityType: 'user_vocabulary_progress',
            entityId: id,
            operation: 'UPSERT',
            payload: jsonEncode(payload),
          ),
        );

    // 4. Trigger queue drain process
    syncProcessor.processQueue();
  }

  @override
  Future<void> markAsLearned(String id, bool isLearned) async {
    final now = DateTime.now();

    await (db.update(db.vocabularyTable)..where((t) => t.id.equals(id))).write(
      VocabularyTableCompanion(
        isLearned: Value(isLearned),
        updatedAt: Value(now),
        isSynced: const Value(false),
      ),
    );

    final updatedItem = await (db.select(
      db.vocabularyTable,
    )..where((t) => t.id.equals(id))).getSingle();

    final userId = SupabaseConfig.currentUserId ?? '';

    final payload = {
      'user_id': userId,
      'vocabulary_id': id,
      'is_favorite': updatedItem.isFavorite,
      'is_learned': isLearned,
      'updated_at': now.toIso8601String(),
    };

    await db
        .into(db.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entityType: 'user_vocabulary_progress',
            entityId: id,
            operation: 'UPSERT',
            payload: jsonEncode(payload),
          ),
        );

    syncProcessor.processQueue();
  }

  /// Pull remote records from Supabase into local database
  @override
  Future<void> fetchRemoteVocabularies() async {
    final userId = SupabaseConfig.currentUserId;

    try {
      // 1. Download all master vocabulary entries from Supabase
      final List<dynamic> vocabResponse = await supabase
          .from('vocabularies')
          .select();

      // 2. Download current user's progress records
      final Map<String, Map<String, dynamic>> progressMap = {};
      if (userId != null && userId.isNotEmpty) {
        final List<dynamic> progressResponse = await supabase
            .from('user_vocabulary_progress')
            .select()
            .eq('user_id', userId);

        for (final item in progressResponse) {
          final mapItem = item as Map<String, dynamic>;
          progressMap[mapItem['vocabulary_id'] as String] = mapItem;
        }
      }

      // 3. Save into local Drift SQLite
      await db.transaction(() async {
        for (final item in vocabResponse) {
          final remoteJson = Map<String, dynamic>.from(item as Map);
          final id = remoteJson['id'] as String;

          final progress = progressMap[id];
          remoteJson['is_favorite'] = progress?['is_favorite'] ?? false;
          remoteJson['is_learned'] = progress?['is_learned'] ?? false;

          await db
              .into(db.vocabularyTable)
              .insertOnConflictUpdate(VocabularyMapper.fromJson(remoteJson));
        }
      });
    } catch (_) {
      // Offline or network error: fail silently and maintain local database cache
    }
  }
}
