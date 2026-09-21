import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supbase_offiline_test/core/remote/supabase_config.dart';
import 'package:supbase_offiline_test/presentation/screens/auth_gate.dart';

import 'presentation/providers/core_providers.dart';
import 'presentation/screens/quiz_screen.dart';
import 'presentation/screens/vocabulary_list_screen.dart';

void main() async {
  // Ensure Flutter engine bindings are initialized before async setup
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase Auth & Storage client
  await SupabaseConfig.initialize();

  runApp(const ProviderScope(child: OfflineFirstApp()));
}

class OfflineFirstApp extends ConsumerWidget {
  const OfflineFirstApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Japanese Offline Study',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  ConsumerState<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [VocabularyListScreen(), QuizScreen()];

  @override
  void initState() {
    super.initState();
    // Eagerly trigger initial sync queue drain upon app launch
    Future.microtask(() {
      ref.read(syncQueueProcessorProvider).processQueue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.style_outlined),
            selectedIcon: Icon(Icons.style),
            label: 'Vocabulary',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            selectedIcon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
        ],
      ),
    );
  }
}
