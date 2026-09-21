import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/local/app_database.dart';
import '../../domain/usecases/vocabulary_usecases.dart';
import 'core_providers.dart';

// Domain Use Case Providers
final getVocabulariesUseCaseProvider = Provider<GetVocabulariesUseCase>((ref) {
  return GetVocabulariesUseCase(ref.watch(vocabularyRepositoryProvider));
});

final toggleFavoriteUseCaseProvider = Provider<ToggleFavoriteUseCase>((ref) {
  return ToggleFavoriteUseCase(ref.watch(vocabularyRepositoryProvider));
});

final markAsLearnedUseCaseProvider = Provider<MarkAsLearnedUseCase>((ref) {
  return MarkAsLearnedUseCase(ref.watch(vocabularyRepositoryProvider));
});

final refreshVocabulariesUseCaseProvider = Provider<RefreshVocabulariesUseCase>(
  (ref) {
    return RefreshVocabulariesUseCase(ref.watch(vocabularyRepositoryProvider));
  },
);

final vocabularyRemoteRefreshProvider = FutureProvider.autoDispose<void>((ref) {
  return ref.watch(refreshVocabulariesUseCaseProvider)();
});

// Search Filter Query Provider
final vocabularySearchQueryProvider = StateProvider<String>((ref) => '');

// Reactive Local Database Stream Provider with Filtering
final vocabularyStreamProvider =
    StreamProvider.autoDispose<List<VocabularyTableData>>((ref) {
      final getVocabularies = ref.watch(getVocabulariesUseCaseProvider);
      final searchQuery = ref
          .watch(vocabularySearchQueryProvider)
          .toLowerCase();

      return getVocabularies().map((list) {
        if (searchQuery.isEmpty) return list;
        return list.where((item) {
          return item.word.toLowerCase().contains(searchQuery) ||
              item.meaning.toLowerCase().contains(searchQuery) ||
              item.reading.toLowerCase().contains(searchQuery);
        }).toList();
      });
    });

// Action Notifier for Local Mutations
class VocabularyNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> toggleFavorite(String id, bool currentStatus) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(toggleFavoriteUseCaseProvider);
      await useCase(id, !currentStatus);
    });
  }

  Future<void> markAsLearned(String id, bool currentStatus) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(markAsLearnedUseCaseProvider);
      await useCase(id, !currentStatus);
    });
  }

  Future<void> refreshFromRemote() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(refreshVocabulariesUseCaseProvider);
      await useCase();
    });
  }
}

final vocabularyNotifierProvider =
    AsyncNotifierProvider<VocabularyNotifier, void>(VocabularyNotifier.new);
