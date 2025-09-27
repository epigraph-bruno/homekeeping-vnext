import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:homekeeping/models/user_model.dart';
import 'package:homekeeping/providers/auth_provider.dart';
import 'package:homekeeping/services/auth_service.dart';
import '../utils/test_utils.dart';

void main() {
  group('AuthProviders', () {
    late ProviderContainer container;
    late MockFirebaseAuth auth;
    late FakeFirebaseFirestore firestore;
    late MockGoogleSignIn googleSignIn;

    setUp(() async {
      final mocks = await setupMockAuth();
      auth = mocks.$1;
      firestore = mocks.$2;
      googleSignIn = mocks.$3;

      container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(
            AuthService(
              auth: auth,
              firestore: firestore,
              googleSignIn: googleSignIn,
            ),
          ),
        ],
      );

      addTearDown(container.dispose);
    });

    test('authStateProvider emits null when not signed in', () async {
      await auth.signOut();
      await Future.delayed(const Duration(milliseconds: 500));
      await container.pump();
      await container.pump();
      await container.pump();
      await container.pump();
      await container.pump();
      
      final authState = container.read(authStateProvider);
      expect(authState.value, isNull);
    });

    test('authStateProvider emits user when signed in', () async {
      // Create a new container with a signed-in user
      final signedInAuth = MockFirebaseAuth(mockUser: mockFirebaseUser);
      final signedInContainer = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(
            AuthService(
              auth: signedInAuth,
              firestore: firestore,
              googleSignIn: googleSignIn,
            ),
          ),
        ],
      );
      
      // Wait for the stream to emit
      final authState = await signedInContainer.read(authStateProvider.future);
      expect(authState?.uid, equals(mockFirebaseUser.uid));
      
      signedInContainer.dispose();
    });

    test('currentUserProvider emits null when not signed in', () async {
      await auth.signOut();
      await Future.delayed(const Duration(milliseconds: 500));
      await container.pump();
      await container.pump();
      await container.pump();
      await container.pump();
      await container.pump();
      
      final userAsync = container.read(currentUserProvider);
      expect(userAsync.value, isNull);
    });

    test('currentUserProvider emits user data when signed in', () async {
      // Create a new container with a signed-in user
      final signedInAuth = MockFirebaseAuth(mockUser: mockFirebaseUser);
      final signedInContainer = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(
            AuthService(
              auth: signedInAuth,
              firestore: firestore,
              googleSignIn: googleSignIn,
            ),
          ),
        ],
      );
      
      // Wait for the future to complete
      final user = await signedInContainer.read(currentUserProvider.future);
      expect(user?.email, equals(mockUserEmail));
      expect(user?.displayName, equals(mockUserDisplayName));
      expect(user?.userCode, equals(mockUserCode));
      expect(user?.isAdmin, equals(mockUserIsAdmin));
      
      signedInContainer.dispose();
    });

    test('providers update when auth state changes', () async {
      // Test signed out state
      final signedOutAuth = MockFirebaseAuth();
      final signedOutContainer = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(
            AuthService(
              auth: signedOutAuth,
              firestore: firestore,
              googleSignIn: googleSignIn,
            ),
          ),
        ],
      );
      
      await Future.delayed(const Duration(milliseconds: 100));
      await signedOutContainer.pump();
      
      expect(signedOutContainer.read(authStateProvider).value, isNull);
      expect(signedOutContainer.read(currentUserProvider).value, isNull);
      
      signedOutContainer.dispose();

      // Test signed in state
      final signedInAuth = MockFirebaseAuth(mockUser: mockFirebaseUser);
      final signedInContainer = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(
            AuthService(
              auth: signedInAuth,
              firestore: firestore,
              googleSignIn: googleSignIn,
            ),
          ),
        ],
      );
      
      await Future.delayed(const Duration(milliseconds: 100));
      await signedInContainer.pump();
      
      final authState = await signedInContainer.read(authStateProvider.future);
      final user = await signedInContainer.read(currentUserProvider.future);
      expect(authState?.uid, equals(mockFirebaseUser.uid));
      expect(user?.email, equals(mockUserEmail));
      
      signedInContainer.dispose();
    });
  });
}