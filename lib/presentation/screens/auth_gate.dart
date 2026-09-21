import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../providers/core_providers.dart';
import '../../main.dart';
import 'login_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateProvider);

    return authStateAsync.when(
      data: (authState) {
        final user = authState.session?.user;

        if (user != null) {
          // Trigger sync processor whenever a valid user session is active
          Future.microtask(() {
            ref.read(syncQueueProcessorProvider).processQueue();
          });
          return const MainNavigationScreen();
        }

        return const LoginScreen();
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) =>
          Scaffold(body: Center(child: Text('Authentication Error: $err'))),
    );
  }
}
