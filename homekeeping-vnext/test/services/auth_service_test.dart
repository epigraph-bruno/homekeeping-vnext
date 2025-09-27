import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:homekeeping/services/auth_service.dart';
import '../utils/test_utils.dart';

void main() {
  group('AuthService', () {
    late AuthService authService;
    late MockFirebaseAuth auth;
    late FakeFirebaseFirestore firestore;
    late MockGoogleSignIn googleSignIn;

    setUp(() async {
      final mocks = await setupMockAuth();
      auth = mocks.$1;
      firestore = mocks.$2;
      googleSignIn = mocks.$3;
      authService = AuthService(
        auth: auth,
        firestore: firestore,
        googleSignIn: googleSignIn,
      );
    });

    test('getCurrentUser returns null when not signed in', () async {
      await auth.signOut();
      final user = await authService.getCurrentUser();
      expect(user, isNull);
    });

    test('getCurrentUser returns user data when signed in and provisioned', () async {
      await auth.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: 'test_token',
          idToken: 'test_id_token',
        ),
      );
      auth.mockUser = mockFirebaseUser;
      await Future.delayed(const Duration(milliseconds: 100));
      final user = await authService.getCurrentUser();
      
      expect(user, isNotNull);
      expect(user!.email, equals(mockUserEmail));
      expect(user.displayName, equals(mockUserDisplayName));
      expect(user.userCode, equals(mockUserCode));
      expect(user.isAdmin, equals(mockUserIsAdmin));
    });

    test('signInWithGoogle succeeds with provisioned user', () async {
      final user = await authService.signInWithGoogle();
      
      expect(user, isNotNull);
      expect(user!.email, equals(mockUserEmail));
      expect(user.displayName, equals(mockUserDisplayName));
      expect(user.userCode, equals(mockUserCode));
      expect(user.isAdmin, equals(mockUserIsAdmin));
    });

    test('signInWithGoogle fails with unprovisioned user', () async {
      // Remove user document from Firestore
      await firestore
        .collection('users')
        .doc(mockFirebaseUser.uid)
        .delete();

      final user = await authService.signInWithGoogle();
      expect(user, isNull);

      // Verify user was signed out
      expect(auth.currentUser, isNull);
    });

    test('signOut signs out from both Firebase and Google', () async {
      // Sign in first
      await authService.signInWithGoogle();
      expect(auth.currentUser, isNotNull);

      // Sign out
      await authService.signOut();
      expect(auth.currentUser, isNull);
      expect(googleSignIn.currentUser, isNull);
      await Future.delayed(const Duration(milliseconds: 100));
    });
  });
}