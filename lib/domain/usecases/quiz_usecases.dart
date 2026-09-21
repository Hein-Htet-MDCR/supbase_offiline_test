import '../../data/local/app_database.dart';
import '../../data/repositories/quiz_repository_impl.dart';

class SubmitQuizUseCase {
  final QuizRepository repository;
  SubmitQuizUseCase(this.repository);

  Future<void> call({
    required String quizType,
    required int score,
    required int totalQuestions,
  }) async {
    await repository.saveQuizResult(
      quizType: quizType,
      score: score,
      totalQuestions: totalQuestions,
    );
  }
}

class GetUserStreakUseCase {
  final QuizRepository repository;
  GetUserStreakUseCase(this.repository);

  Stream<UserStreakTableData?> call() {
    return repository.watchUserStreak();
  }
}