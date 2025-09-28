import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:homekeeping/providers/auth_provider.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Homekeeping',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'Version: DEBUG-v2.2 🎯',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // MULTIPLE debug methods to ensure visibility
                print('🚀🚀🚀 BUTTON DEFINITELY CLICKED! 🚀🚀🚀');
                debugPrint('🚀🚀🚀 BUTTON DEFINITELY CLICKED! 🚀🚀🚀');
                // ignore: avoid_print
                print('🚨🚨🚨 FLUTTER BUTTON HANDLER CALLED! 🚨🚨🚨');
                _handleSignIn(context, ref);
              },
              icon: const Icon(Icons.login),
              label: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn(BuildContext context, WidgetRef ref) async {
    print('🚀 BUTTON CLICKED: Starting sign-in process...');
    try {
      print('🚀 CALLING: authServiceProvider.signInWithGoogle()');
      final user = await ref.read(authServiceProvider).signInWithGoogle();
      print('🚀 RESULT: signInWithGoogle returned: ${user != null ? 'USER' : 'NULL'}');
      if (user == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Not authorized. Please contact admin.'),
            ),
          );
        }
        return;
      }

      if (context.mounted) {
        context.go('/agenda');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error signing in: $e')),
        );
      }
    }
  }
}