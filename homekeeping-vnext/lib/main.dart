import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/firebase_options.dart';
import 'package:homekeeping/providers/auth_provider.dart';
import 'package:homekeeping/screens/auth/sign_in_screen.dart';
import 'package:homekeeping/screens/home/agenda_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    const ProviderScope(
      child: HomekeepingApp(),
    ),
  );
}

class HomekeepingApp extends ConsumerWidget {
  const HomekeepingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    
    return MaterialApp(
      title: 'Homekeeping',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: authState.when(
        data: (user) => user != null ? const AgendaScreen() : const SignInScreen(),
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (_, __) => const Scaffold(
          body: Center(
            child: Text('Error initializing app'),
          ),
        ),
      ),
    );
  }
}