import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://mipcriujwmknznpdbhti.supabase.co';
  static const String supabaseAnonKey =
      'sb_publishable_lNbflvLmR4oQGX5jnlBYCA_ZawxYxaF';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );
  }

  static SupabaseClient get client => Supabase.instance.client;

  static String? get currentUserId => client.auth.currentUser?.id;
  static bool get isAuthenticated => client.auth.currentUser != null;
}
