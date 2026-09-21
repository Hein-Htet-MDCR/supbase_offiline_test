import '../../data/local/app_database.dart';
import '../../data/repositories/vocabulary_repository_impl.dart';

class GetVocabulariesUseCase {
  final VocabularyRepository repository;
  GetVocabulariesUseCase(this.repository);

  Stream<List<VocabularyTableData>> call() {
    return repository.watchVocabularies();
  }
}

class ToggleFavoriteUseCase {
  final VocabularyRepository repository;
  ToggleFavoriteUseCase(this.repository);

  Future<void> call(String id, bool isFavorite) async {
    await repository.toggleFavorite(id, isFavorite);
  }
}

class MarkAsLearnedUseCase {
  final VocabularyRepository repository;
  MarkAsLearnedUseCase(this.repository);

  Future<void> call(String id, bool isLearned) async {
    await repository.markAsLearned(id, isLearned);
  }
}

class RefreshVocabulariesUseCase {
  final VocabularyRepository repository;
  RefreshVocabulariesUseCase(this.repository);

  Future<void> call() async {
    await repository.fetchRemoteVocabularies();
  }
}