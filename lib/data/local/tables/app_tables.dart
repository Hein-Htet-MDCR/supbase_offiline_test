import 'package:drift/drift.dart';

/// Local storage for Vocabulary items
class VocabularyTable extends Table {
  TextColumn get id => text()();
  TextColumn get word => text()();
  TextColumn get reading => text()();
  TextColumn get meaning => text()();
  IntColumn get jlptLevel => integer().withDefault(const Constant(5))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get isLearned => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Local storage for Kanji items
class KanjiTable extends Table {
  TextColumn get id => text()();
  TextColumn get character => text()();
  TextColumn get meanings => text()(); // Comma-separated or JSON string
  TextColumn get onyomi => text()();
  TextColumn get kunyomi => text()();
  IntColumn get strokeCount => integer().withDefault(const Constant(1))();
  IntColumn get jlptLevel => integer().withDefault(const Constant(5))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get isLearned => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Local storage for Quiz Results
class QuizResultTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get quizType => text()(); // 'vocabulary', 'kanji', 'mixed'
  IntColumn get score => integer()();
  IntColumn get totalQuestions => integer()();
  DateTimeColumn get completedAt =>
      dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Local storage for User Streak and Gamification Stats
class UserStreakTable extends Table {
  TextColumn get userId => text()();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastActivityDate => dateTime().nullable()();
  IntColumn get totalPoints => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {userId};
}

/// Offline Mutation Sync Queue
class SyncQueueTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType =>
      text()(); // 'vocabulary', 'kanji', 'quiz_result', 'user_streak'
  TextColumn get entityId => text()();
  TextColumn get operation => text()(); // 'INSERT', 'UPDATE', 'DELETE'
  TextColumn get payload => text()(); // JSON representation of data change
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
}

class UserProfileTable extends Table {
  TextColumn get id => text()();
  TextColumn get email => text().nullable()();
  TextColumn get displayName => text().nullable()();
  BoolColumn get isAnonymous => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
