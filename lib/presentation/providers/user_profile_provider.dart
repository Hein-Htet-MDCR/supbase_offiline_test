import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/local/app_database.dart';
import '../../data/repositories/user_repository.dart';
import 'auth_provider.dart';
import 'core_providers.dart';

/// Provider for UserRepository instance
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final supabase = Supabase.instance.client;
  return UserRepository(db, supabase);
});

/// AsyncNotifier managing profile state
final userProfileProvider =
    AsyncNotifierProvider<UserProfileNotifier, UserProfileTableData?>(() {
      return UserProfileNotifier();
    });

class UserProfileNotifier extends AsyncNotifier<UserProfileTableData?> {
  @override
  Future<UserProfileTableData?> build() async {
    // Re-build state when active user changes
    final user = ref.watch(currentUserProvider);
    if (user == null) return null;

    final repository = ref.read(userRepositoryProvider);

    // 1. Immediately yield local SQLite cached data for instant UI load
    final localProfile = await repository.getLocalProfile(user.id);

    // 2. Trigger background sync from Supabase without blocking initial render
    unawaited(_fetchRemoteAndUpdate(user.id));

    return localProfile;
  }

  /// Background fetch from Supabase to refresh local cache & notifier state
  Future<void> _fetchRemoteAndUpdate(String userId) async {
    try {
      final repository = ref.read(userRepositoryProvider);
      await repository.syncUserProfile(userId);

      final updatedProfile = await repository.getLocalProfile(userId);
      if (updatedProfile != null && ref.mounted) {
        state = AsyncData(updatedProfile);
      }
    } catch (_) {
      // Offline fallback: keep existing local profile state intact
    }
  }

  /// Update user's display name with optimistic UI update
  Future<void> updateDisplayName(String newName) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final repository = ref.read(userRepositoryProvider);
    final previousState = state.value;

    // Optimistically update in-memory state
    if (previousState != null) {
      state = AsyncData(
        UserProfileTableData(
          id: previousState.id,
          email: previousState.email,
          displayName: newName,
          isAnonymous: previousState.isAnonymous,
          createdAt: previousState.createdAt,
        ),
      );
    }

    try {
      await repository.updateDisplayName(user.id, newName);
    } catch (e) {
      // Rollback on failure
      if (ref.mounted) state = AsyncData(previousState);
      rethrow;
    }
  }
}
