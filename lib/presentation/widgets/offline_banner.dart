import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/core_providers.dart';

final connectivityStatusProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  return connectivity.onConnectivityChanged;
});

final pendingSyncCountProvider = StreamProvider<int>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db
      .select(db.syncQueueTable)
      .watch()
      .map((items) => items.length);
});

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityAsync = ref.watch(connectivityStatusProvider);
    final pendingCountAsync = ref.watch(pendingSyncCountProvider);

    final isOffline = connectivityAsync.when(
      data: (results) => results.every((r) => r == ConnectivityResult.none),
      loading: () => false,
      error: (_, __) => false,
    );

    final pendingCount = pendingCountAsync.value ?? 0;

    if (!isOffline && pendingCount == 0) {
      return const SizedBox.shrink();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: isOffline ? Colors.redAccent.shade700 : Colors.amber.shade800,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isOffline ? Icons.wifi_off_rounded : Icons.sync_rounded,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            isOffline
                ? 'Offline Mode — Changes saved locally${pendingCount > 0 ? " ($pendingCount queued)" : ""}'
                : 'Syncing $pendingCount local change${pendingCount > 1 ? "s" : ""}...',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}