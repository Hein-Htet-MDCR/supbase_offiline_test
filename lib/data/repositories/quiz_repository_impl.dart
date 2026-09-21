import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase_offiline_test/core/remote/supabase_config.dart';
import 'package:uuid/uuid.dart';
import '../local/app_database.dart';
import '../models/mappers.dart';
import '../sync/sync_queue_processor.dart';

abstract class QuizRepository {
  Future<void> saveQuizResult({
    required String quizType,
    required int score,
    required int totalQuestions,
  });
  Stream<UserStreakTableData?> watchUserStreak();
}

class QuizRepositoryImpl implements QuizRepository {
  final AppDatabase db;
  final SupabaseClient supabase;
  final SyncQueueProcessor syncProcessor;

  QuizRepositoryImpl({
    required this.db,
    required this.supabase,
    required this.syncProcessor,
  });

  @override
  Future<void> saveQuizResult({
    required String quizType,
    required int score,
    required int totalQuestions,
  }) async {
    final userId = SupabaseConfig.currentUserId ?? 'local_user';
    final resultId = const Uuid().v4();
    final now = DateTime.now();

    final resultData = QuizResultTableCompanion(
      id: Value(resultId),
      userId: Value(userId),
      quizType: Value(quizType),
      score: Value(score),
      totalQuestions: Value(totalQuestions),
      completedAt: Value(now),
      isSynced: const Value(false),
    );

    // 1. Store quiz result locally
    await db.into(db.quizResultTable).insert(resultData);

    // 2. Calculate updated streak and total points locally
    await _updateLocalStreak(userId, score);

    // 3. Queue Quiz Result payload
    final row = await (db.select(db.quizResultTable)
          ..where((t) => t.id.equals(resultId)))
        .getSingle();

    await db.into(db.syncQueueTable).insert(
          SyncQueueTableCompanion.insert(
            entityType: 'quiz_result',
            entityId: resultId,
            operation: 'INSERT',
            payload: jsonEncode(QuizResultMapper.toJson(row)),
          ),
        );

    // 4. Trigger Queue Processing
    syncProcessor.processQueue();
  }

  Future<void> _updateLocalStreak(String userId, int pointsGained) async {
    final currentStreakData = await (db.select(db.userStreakTable)
          ..where((t) => t.userId.equals(userId)))
        .getSingleOrNull();

    final now = DateTime.now();
    int newStreak = 1;
    int newLongest = 1;
    int totalPoints = pointsGained;

    if (currentStreakData != null) {
      final lastDate = currentStreakData.lastActivityDate;
      totalPoints += currentStreakData.totalPoints;

      if (lastDate != null) {
        final isSameDay = lastDate.year == now.year &&
            lastDate.month == now.month &&
            lastDate.day == now.day;
        final isYesterday = lastDate.year == now.year &&
            lastDate.month == now.month &&
            lastDate.day == now.day - 1;

        if (isSameDay) {
          newStreak = currentStreakData.currentStreak;
        } else if (isYesterday) {
          newStreak = currentStreakData.currentStreak + 1;
        } else {
          newStreak = 1;
        }
      }

      newLongest = newStreak > currentStreakData.longestStreak
          ? newStreak
          : currentStreakData.longestStreak;
    }

    final updatedStreakCompanion = UserStreakTableCompanion(
      userId: Value(userId),
      currentStreak: Value(newStreak),
      longestStreak: Value(newLongest),
      lastActivityDate: Value(now),
      totalPoints: Value(totalPoints),
      updatedAt: Value(now),
      isSynced: const Value(false),
    );

    await db
        .into(db.userStreakTable)
        .insertOnConflictUpdate(updatedStreakCompanion);

    // Queue streak update
    await db.into(db.syncQueueTable).insert(
          SyncQueueTableCompanion.insert(
            entityType: 'user_streak',
            entityId: userId,
            operation: 'UPDATE',
            payload: jsonEncode({
              'user_id': userId,
              'current_streak': newStreak,
              'longest_streak': newLongest,
              'last_activity_date': now.toIso8601String(),
              'total_points': totalPoints,
              'updated_at': now.toIso8601String(),
            }),
          ),
        );
  }

  @override
  Stream<UserStreakTableData?> watchUserStreak() {
    final userId = SupabaseConfig.currentUserId ?? 'local_user';
    return (db.select(db.userStreakTable)..where((t) => t.userId.equals(userId)))
        .watchSingleOrNull();
  }
}