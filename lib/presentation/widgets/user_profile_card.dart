import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_profile_provider.dart';
import 'upgrade_account_dialog.dart';

class UserProfileCard extends ConsumerWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    return profileAsync.when(
      data: (profile) {
        if (profile == null) {
          return const Card(child: ListTile(title: Text('Not Signed In')));
        }

        final displayName = profile.displayName ?? 'Guest User';
        final initial = displayName.isNotEmpty
            ? displayName[0].toUpperCase()
            : '?';

        return Card(
          margin: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(initial),
            ),
            title: Text(
              displayName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              profile.isAnonymous
                  ? 'Guest Mode (Offline Available)'
                  : (profile.email ?? ''),
            ),
            trailing: profile.isAnonymous
                ? ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const UpgradeAccountDialog(),
                      );
                    },
                    child: const Text('Save Account'),
                  )
                : IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () =>
                        _showEditNameDialog(context, ref, displayName),
                  ),
          ),
        );
      },
      loading: () => const Card(
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, _) => Card(
        margin: const EdgeInsets.all(16.0),
        child: ListTile(
          title: const Text('Error loading profile'),
          subtitle: Text(error.toString()),
        ),
      ),
    );
  }

  void _showEditNameDialog(
    BuildContext context,
    WidgetRef ref,
    String currentName,
  ) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Display Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Display Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newName = controller.text.trim();
              if (newName.isNotEmpty) {
                ref
                    .read(userProfileProvider.notifier)
                    .updateDisplayName(newName);
              }
              Navigator.pop(dialogContext);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
