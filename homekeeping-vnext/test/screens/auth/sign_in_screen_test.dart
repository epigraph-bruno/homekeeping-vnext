import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:homekeeping/screens/auth/sign_in_screen.dart';
import 'package:homekeeping/screens/home/agenda_screen.dart';
import '../../utils/test_utils.dart';

void main() {
  group('SignInScreen', () {
    testWidgets('shows sign in button', (tester) async {
      await pumpAuthWidget(tester, const SignInScreen());
      
      expect(find.text('Sign in with Google'), findsOneWidget);
      expect(find.byIcon(Icons.login), findsOneWidget);
    });

    testWidgets('navigates to AgendaScreen on successful sign in',
        (tester) async {
      final (auth, firestore, googleSignIn) = await setupMockAuth();

      final router = GoRouter(
        initialLocation: '/sign-in',
        routes: [
          GoRoute(
            path: '/sign-in',
            builder: (context, state) => const SignInScreen(),
          ),
          GoRoute(
            path: '/agenda',
            builder: (context, state) => const AgendaScreen(),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
          builder: (context, child) => createTestProviderScope(
            child: child!,
            auth: auth,
            firestore: firestore,
            googleSignIn: googleSignIn,
          ),
        ),
      );

      // Tap sign in button
      await tester.tap(find.text('Sign in with Google'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // Should navigate to AgendaScreen
      expect(find.byType(AgendaScreen), findsOneWidget);
    });

    testWidgets('shows error message for unprovisioned user',
        (tester) async {
      final (auth, firestore, googleSignIn) = await setupMockAuth();

      // Remove user document to simulate unprovisioned user
      await firestore
        .collection('users')
        .doc(mockFirebaseUser.uid)
        .delete();

      final router = GoRouter(
        initialLocation: '/sign-in',
        routes: [
          GoRoute(
            path: '/sign-in',
            builder: (context, state) => const SignInScreen(),
          ),
          GoRoute(
            path: '/agenda',
            builder: (context, state) => const AgendaScreen(),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
          scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
          builder: (context, child) => createTestProviderScope(
            child: child!,
            auth: auth,
            firestore: firestore,
            googleSignIn: googleSignIn,
          ),
        ),
      );

      // Tap sign in button
      await tester.tap(find.text('Sign in with Google'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // Should show error message
      expect(
        find.text('Not authorized. Please contact admin.'),
        findsOneWidget,
      );

      // Should stay on SignInScreen
      expect(find.byType(SignInScreen), findsOneWidget);
      expect(find.byType(AgendaScreen), findsNothing);
    });

    testWidgets('handles sign in cancellation gracefully',
        (tester) async {
      final (auth, firestore, googleSignIn) = await setupMockAuth();

      // Configure Google Sign In to simulate cancellation
      googleSignIn.setIsCancelled(true);

      final router = GoRouter(
        initialLocation: '/sign-in',
        routes: [
          GoRoute(
            path: '/sign-in',
            builder: (context, state) => const SignInScreen(),
          ),
          GoRoute(
            path: '/agenda',
            builder: (context, state) => const AgendaScreen(),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
          scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
          builder: (context, child) => createTestProviderScope(
            child: child!,
            auth: auth,
            firestore: firestore,
            googleSignIn: googleSignIn,
          ),
        ),
      );

      // Tap sign in button
      await tester.tap(find.text('Sign in with Google'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // Should stay on SignInScreen without error
      expect(find.byType(SignInScreen), findsOneWidget);
      expect(find.byType(AgendaScreen), findsNothing);
      expect(find.text('Error signing in'), findsNothing);
    });
  });
}