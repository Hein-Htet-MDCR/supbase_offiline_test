import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/app_database.dart';
import '../providers/vocabulary_provider.dart';
import '../widgets/offline_banner.dart';
import '../widgets/sync_status_indicator.dart';

class VocabularyListScreen extends ConsumerWidget {
  const VocabularyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(vocabularyRemoteRefreshProvider);
    final vocabulariesAsync = ref.watch(vocabularyStreamProvider);
    final actionState = ref.watch(vocabularyNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                ref.read(vocabularySearchQueryProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: 'Search word, reading, or meaning...',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const OfflineBanner(),
          if (actionState.isLoading)
            const LinearProgressIndicator(minHeight: 2),
          Expanded(
            child: vocabulariesAsync.when(
              data: (vocabList) {
                if (vocabList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.style_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No vocabulary found',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: actionState.isLoading
                              ? null
                              : () => ref
                                    .read(vocabularyNotifierProvider.notifier)
                                    .refreshFromRemote(),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Refresh'),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .read(vocabularyNotifierProvider.notifier)
                        .refreshFromRemote();
                  },
                  child: ListView.separated(
                    itemCount: vocabList.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final item = vocabList[index];
                      return _VocabularyTile(item: item);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text('Failed to load local data: $err'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => ref.invalidate(vocabularyStreamProvider),
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

class _VocabularyTile extends ConsumerWidget {
  final VocabularyTableData item;

  const _VocabularyTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(vocabularyNotifierProvider.notifier);

    return ListTile(
      title: Row(
        children: [
          Text(
            item.word,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(width: 8),
          Text(
            '【${item.reading}】',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          ),
          const Spacer(),
          SyncStatusIndicator(isSynced: item.isSynced),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(item.meaning, style: const TextStyle(fontSize: 14)),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              item.isLearned ? Icons.check_circle : Icons.check_circle_outline,
              color: item.isLearned ? Colors.green : Colors.grey,
            ),
            onPressed: () => notifier.markAsLearned(item.id, item.isLearned),
            tooltip: item.isLearned ? 'Mark Unlearned' : 'Mark Learned',
          ),
          IconButton(
            icon: Icon(
              item.isFavorite ? Icons.star : Icons.star_border,
              color: item.isFavorite ? Colors.amber : Colors.grey,
            ),
            onPressed: () => notifier.toggleFavorite(item.id, item.isFavorite),
            tooltip: item.isFavorite ? 'Remove Favorite' : 'Add Favorite',
          ),
        ],
      ),
    );
  }
}
