import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/app_database.dart';
import '../../domain/usecases/quiz_usecases.dart';
import 'core_providers.dart';
import 'vocabulary_provider.dart';

class QuizQuestion {
  final VocabularyTableData vocabulary;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.vocabulary,
    required this.options,
    required this.correctAnswer,
  });
}

class QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final int score;
  final bool isCompleted;

  QuizState({
    required this.questions,
    this.currentIndex = 0,
    this.score = 0,
    this.isCompleted = false,
  });

  QuizQuestion? get currentQuestion =>
      questions.isNotEmpty && currentIndex < questions.length
          ? questions[currentIndex]
          : null;

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentIndex,
    int? score,
    bool? isCompleted,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

// User Streak Stream Provider
final userStreakStreamProvider = StreamProvider.autoDispose<UserStreakTableData?>((ref) {
  final repository = ref.watch(quizRepositoryProvider);
  final getStreakUseCase = GetUserStreakUseCase(repository);
  return getStreakUseCase();
});

// Quiz State Notifier
class QuizNotifier extends AsyncNotifier<QuizState> {
  @override
  Future<QuizState> build() async {
    final vocabularies = await ref.watch(vocabularyStreamProvider.future);
    return _generateQuiz(vocabularies);
  }

  QuizState _generateQuiz(List<VocabularyTableData> vocabularies) {
    if (vocabularies.length < 4) {
      return QuizState(questions: [], isCompleted: false);
    }

    final shuffled = List<VocabularyTableData>.from(vocabularies)..shuffle();
    final questions = <QuizQuestion>[];

    for (int i = 0; i < min(10, shuffled.length); i++) {
      final target = shuffled[i];
      final distractorOptions = vocabularies
          .where((v) => v.id != target.id)
          .map((v) => v.meaning)
          .toList()
        ..shuffle();

      final options = [target.meaning, ...distractorOptions.take(3)]..shuffle();

      questions.add(
        QuizQuestion(
          vocabulary: target,
          options: options,
          correctAnswer: target.meaning,
        ),
      );
    }

    return QuizState(questions: questions);
  }

  Future<void> submitAnswer(String answer) async {
    final currentState = state.value;
    if (currentState == null || currentState.isCompleted) return;

    final question = currentState.currentQuestion;
    if (question == null) return;

    final isCorrect = answer == question.correctAnswer;
    final updatedScore = isCorrect ? currentState.score + 1 : currentState.score;
    final isLastQuestion = currentState.currentIndex >= currentState.questions.length - 1;

    if (isLastQuestion) {
      final repository = ref.read(quizRepositoryProvider);
      final submitQuizUseCase = SubmitQuizUseCase(repository);

      await submitQuizUseCase(
        quizType: 'vocabulary',
        score: updatedScore,
        totalQuestions: currentState.questions.length,
      );

      state = AsyncValue.data(
        currentState.copyWith(
          score: updatedScore,
          isCompleted: true,
        ),
      );
    } else {
      state = AsyncValue.data(
        currentState.copyWith(
          score: updatedScore,
          currentIndex: currentState.currentIndex + 1,
        ),
      );
    }
  }

  void restartQuiz() {
    ref.invalidateSelf();
  }
}

final quizNotifierProvider =
    AsyncNotifierProvider<QuizNotifier, QuizState>(QuizNotifier.new);