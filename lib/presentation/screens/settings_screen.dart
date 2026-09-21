import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../providers/core_providers.dart';
import '../widgets/user_profile_card.dart';

/// StreamProvider dynamically watching the pending queue length in Drift SQLite
final pendingSyncCountProvider = StreamProvider<int>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.syncQueueTable).watch().map((items) => items.length);
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingCountAsync = ref.watch(pendingSyncCountProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        children: [
          // 1. User Profile & Account Linking Card
          const UserProfileCard(),
          const Divider(),

          // 2. Data & Sync Section
          const _SectionHeader(title: 'Data & Synchronization'),
          ListTile(
            leading: const Icon(Icons.sync_outlined),
            title: const Text('Pending Sync Queue'),
            subtitle: const Text('Offline changes waiting to upload'),
            trailing: pendingCountAsync.when(
              data: (count) => Chip(
                avatar: Icon(
                  count > 0 ? Icons.cloud_upload_outlined : Icons.cloud_done,
                  size: 16,
                  color: count > 0 ? Colors.orange : Colors.green,
                ),
                label: Text(
                  '$count',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: count > 0
                    ? Colors.orange.withOpacity(0.12)
                    : Colors.green.withOpacity(0.12),
              ),
              loading: () => const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              error: (_, __) =>
                  const Icon(Icons.error_outline, color: Colors.red),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.refresh_outlined),
            title: const Text('Force Manual Sync'),
            subtitle: const Text('Immediately process pending queue'),
            onTap: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Processing sync queue...'),
                  duration: Duration(seconds: 1),
                ),
              );
              await ref.read(syncQueueProcessorProvider).processQueue();
            },
          ),
          const Divider(),

          // 3. Account Actions
          const _SectionHeader(title: 'Account'),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () => _showLogoutConfirmation(context, ref),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text(
          'Are you sure you want to log out? Any pending changes will remain stored in local SQLite storage until you log back in.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.pop(dialogContext);
              await ref.read(authRepositoryProvider).signOut();
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
