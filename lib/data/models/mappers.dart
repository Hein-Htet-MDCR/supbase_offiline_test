import 'package:drift/drift.dart';
import '../local/app_database.dart';

class VocabularyMapper {
  static VocabularyTableCompanion fromJson(Map<String, dynamic> json) {
    return VocabularyTableCompanion(
      id: Value(json['id'] as String),
      word: Value(json['word'] as String),
      reading: Value(json['reading'] as String),
      meaning: Value(json['meaning'] as String),
      jlptLevel: Value(json['jlpt_level'] as int? ?? 5),
      isFavorite: Value(json['is_favorite'] as bool? ?? false),
      isLearned: Value(json['is_learned'] as bool? ?? false),
      updatedAt: Value(DateTime.parse(json['updated_at'] as String)),
      isSynced: const Value(true),
    );
  }

  static Map<String, dynamic> toJson(VocabularyTableData entity, String userId) {
    return {
      'id': entity.id,
      'word': entity.word,
      'reading': entity.reading,
      'meaning': entity.meaning,
      'jlpt_level': entity.jlptLevel,
      'is_favorite': entity.isFavorite,
      'is_learned': entity.isLearned,
      'updated_at': entity.updatedAt.toIso8601String(),
      'user_id': userId,
    };
  }
}

class QuizResultMapper {
  static Map<String, dynamic> toJson(QuizResultTableData entity) {
    return {
      'id': entity.id,
      'user_id': entity.userId,
      'quiz_type': entity.quizType,
      'score': entity.score,
      'total_questions': entity.totalQuestions,
      'completed_at': entity.completedAt.toIso8601String(),
    };
  }
}