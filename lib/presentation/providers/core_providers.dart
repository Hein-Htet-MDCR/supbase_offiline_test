import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supbase_offiline_test/core/remote/supabase_config.dart';
import '../../data/local/app_database.dart';

import '../../data/repositories/quiz_repository_impl.dart';
import '../../data/repositories/vocabulary_repository_impl.dart';
import '../../data/sync/sync_queue_processor.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

final syncQueueProcessorProvider = Provider<SyncQueueProcessor>((ref) {
  return SyncQueueProcessor(
    db: ref.watch(appDatabaseProvider),
    supabase: SupabaseConfig.client,
    connectivity: ref.watch(connectivityProvider),
  );
});

final vocabularyRepositoryProvider = Provider<VocabularyRepository>((ref) {
  return VocabularyRepositoryImpl(
    db: ref.watch(appDatabaseProvider),
    supabase: SupabaseConfig.client,
    syncProcessor: ref.watch(syncQueueProcessorProvider),
  );
});

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  return QuizRepositoryImpl(
    db: ref.watch(appDatabaseProvider),
    supabase: SupabaseConfig.client,
    syncProcessor: ref.watch(syncQueueProcessorProvider),
  );
});
