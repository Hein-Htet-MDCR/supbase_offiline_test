import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../local/app_database.dart';

class UserRepository {
  final AppDatabase _db;
  final SupabaseClient _supabase;

  UserRepository(this._db, this._supabase);

  /// Get profile from local SQLite database
  Future<UserProfileTableData?> getLocalProfile(String userId) async {
    return await (_db.select(
      _db.userProfileTable,
    )..where((t) => t.id.equals(userId))).getSingleOrNull();
  }

  /// Fetch profile from Supabase and cache it locally
  Future<void> syncUserProfile(String userId) async {
    try {
      final response = await _supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (response != null) {
        await _db
            .into(_db.userProfileTable)
            .insertOnConflictUpdate(
              UserProfileTableCompanion.insert(
                id: response['id'],
                email: Value(response['email']),
                displayName: Value(response['display_name']),
                isAnonymous: Value(response['is_anonymous'] ?? false),
              ),
            );
      }
    } catch (e) {
      // Offline fallback: ignore network fetch errors
    }
  }

  /// Update display name locally and queue for remote update
  Future<void> updateDisplayName(String userId, String newName) async {
    // 1. Update local database
    await (_db.update(_db.userProfileTable)..where((t) => t.id.equals(userId)))
        .write(UserProfileTableCompanion(displayName: Value(newName)));

    // 2. Push to Supabase if online
    try {
      await _supabase
          .from('profiles')
          .update({
            'display_name': newName,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', userId);
    } catch (_) {
      // Optional: push to SyncQueueTable if offline
    }
  }
}
