import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  /// Current authenticated user or null
  User? get currentUser => _supabase.auth.currentUser;
  bool get isAnonymous => currentUser?.isAnonymous ?? false;

  /// Current user ID string for local DB tagging
  String? get currentUserId => _supabase.auth.currentUser?.id;

  /// Stream of authentication state changes
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  /// Anonymous Sign-in (allows instant offline/online usage without forms)
  Future<AuthResponse> signInAnonymously() async {
    return await _supabase.auth.signInAnonymously();
  }

  /// Email & Password Sign Up
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  /// Email & Password Sign In
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Upgrades an anonymous guest session to a permanent email/password account in-place.
  /// Preserves the exact same `auth.uid()`.
  Future<UserResponse> linkAnonymousToEmail({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.updateUser(
      UserAttributes(email: email, password: password),
    );
    return response;
  }

  /// Sign Out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
