import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/app_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    VocabularyTable,
    KanjiTable,
    QuizResultTable,
    UserStreakTable,
    SyncQueueTable,
    UserProfileTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2; // Incremented for database version control

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      // Enforce SQLite Foreign Key constraints
      await customStatement('PRAGMA foreign_keys = ON;');
    },
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // Migration example: Adding lastError column to sync_queue_table
        await m.addColumn(syncQueueTable, syncQueueTable.lastError);
      }
    },
  );

  // Helper clear method for user logout
  Future<void> clearUserData() async {
    await transaction(() async {
      await delete(syncQueueTable).go();
      await delete(quizResultTable).go();
      await delete(userStreakTable).go();
      // Reset local favorite and learned statuses
      await update(vocabularyTable).write(
        const VocabularyTableCompanion(
          isFavorite: Value(false),
          isLearned: Value(false),
          isSynced: Value(true),
        ),
      );
      await update(kanjiTable).write(
        const KanjiTableCompanion(
          isFavorite: Value(false),
          isLearned: Value(false),
          isSynced: Value(true),
        ),
      );
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
