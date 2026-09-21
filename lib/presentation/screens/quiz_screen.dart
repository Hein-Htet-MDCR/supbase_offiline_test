import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/quiz_provider.dart';
import '../widgets/offline_banner.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizStateAsync = ref.watch(quizNotifierProvider);
    final streakAsync = ref.watch(userStreakStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary Quiz'),
        actions: [
          streakAsync.when(
            data: (streak) => Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.local_fire_department, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(
                    '${streak?.currentStreak ?? 0}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: Column(
        children: [
          const OfflineBanner(),
          Expanded(
            child: quizStateAsync.when(
              data: (quizState) {
                if (quizState.questions.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.quiz_outlined,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Not enough local vocabulary for a quiz.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Need at least 4 items stored locally.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () => ref
                                .read(quizNotifierProvider.notifier)
                                .restartQuiz(),
                            child: const Text('Check Again'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (quizState.isCompleted) {
                  return _QuizCompletedView(
                    score: quizState.score,
                    total: quizState.questions.length,
                    onRestart: () =>
                        ref.read(quizNotifierProvider.notifier).restartQuiz(),
                  );
                }

                final currentQuestion = quizState.currentQuestion!;
                final progress =
                    (quizState.currentIndex + 1) / quizState.questions.length;

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LinearProgressIndicator(value: progress),
                      const SizedBox(height: 12),
                      Text(
                        'Question ${quizState.currentIndex + 1} of ${quizState.questions.length}',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const Spacer(),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 36,
                            horizontal: 16,
                          ),
                          child: Column(
                            children: [
                              Text(
                                currentQuestion.vocabulary.word,
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                currentQuestion.vocabulary.reading,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      ...currentQuestion.options.map((option) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              ref
                                  .read(quizNotifierProvider.notifier)
                                  .submitAnswer(option);
                            },
                            child: Text(
                              option,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      }),
                      const Spacer(),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Quiz Error: $err'),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(quizNotifierProvider.notifier).restartQuiz(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizCompletedView extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;

  const _QuizCompletedView({
    required this.score,
    required this.total,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / total * 100).round();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_events_rounded,
              size: 80,
              color: Colors.amber,
            ),
            const SizedBox(height: 16),
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'You scored $score out of $total ($percentage%)',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Result saved locally and queued for cloud sync.',
              style: TextStyle(color: Colors.grey, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.replay),
              label: const Text('Take Another Quiz'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
