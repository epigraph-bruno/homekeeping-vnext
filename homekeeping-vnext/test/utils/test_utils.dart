import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:homekeeping/providers/auth_provider.dart';
import 'package:homekeeping/services/auth_service.dart';

// Mock user data
const mockUserEmail = 'test@example.com';
const mockUserDisplayName = 'Test User';
const mockUserCode = 'BG';
const mockUserIsAdmin = true;

// Create a mock Firebase user
final mockFirebaseUser = MockUser(
  uid: 'test_uid',
  email: mockUserEmail,
  displayName: mockUserDisplayName,
);

// Custom MockGoogleSignIn to properly handle sign-out
class CustomMockGoogleSignIn extends MockGoogleSignIn {
  GoogleSignInAccount? _currentUser;
  bool _isCancelled = false;

  @override
  Future<GoogleSignInAccount?> signIn() async {
    if (_isCancelled) return null;
    _currentUser = MockGoogleSignInAccount();
    return _currentUser;
  }

  @override
  Future<GoogleSignInAccount?> signOut() async {
    _currentUser = null;
    return null;
  }

  @override
  GoogleSignInAccount? get currentUser => _currentUser;

  void setIsCancelled(bool value) {
    _isCancelled = value;
  }
}

// Create a mock Firestore user document
final mockUserDoc = {
  'uid': mockFirebaseUser.uid,
  'email': mockUserEmail,
  'displayName': mockUserDisplayName,
  'code': mockUserCode,
  'isAdmin': mockUserIsAdmin,
};

/// Helper to create a mock auth environment
Future<(MockFirebaseAuth, FakeFirebaseFirestore, CustomMockGoogleSignIn)> setupMockAuth() async {
  final googleSignIn = CustomMockGoogleSignIn();
  final auth = MockFirebaseAuth(mockUser: mockFirebaseUser);
  final firestore = FakeFirebaseFirestore();

  // Add mock user to Firestore
  await firestore
    .collection('users')
    .doc(mockFirebaseUser.uid)
    .set(mockUserDoc);

  return (auth, firestore, googleSignIn);
}

/// Helper to create a ProviderScope with mocked dependencies
ProviderScope createTestProviderScope({
  required Widget child,
  required MockFirebaseAuth auth,
  required FakeFirebaseFirestore firestore,
  required CustomMockGoogleSignIn googleSignIn,
}) {
  return ProviderScope(
    overrides: [
      authServiceProvider.overrideWithValue(
        AuthService(
          auth: auth,
          firestore: firestore,
          googleSignIn: googleSignIn,
        ),
      ),
    ],
    child: child,
  );
}

/// Helper to wrap a widget with MaterialApp and mock providers
Widget createTestableWidget({
  required Widget child,
  required MockFirebaseAuth auth,
  required FakeFirebaseFirestore firestore,
  required CustomMockGoogleSignIn googleSignIn,
}) {
  return MaterialApp(
    home: createTestProviderScope(
      child: child,
      auth: auth,
      firestore: firestore,
      googleSignIn: googleSignIn,
    ),
  );
}

/// Helper to pump a widget with mock auth environment
Future<void> pumpAuthWidget(
  WidgetTester tester,
  Widget widget,
) async {
  final (auth, firestore, googleSignIn) = await setupMockAuth();
  
  await tester.pumpWidget(
    createTestableWidget(
      child: widget,
      auth: auth,
      firestore: firestore,
      googleSignIn: googleSignIn,
    ),
  );
}

/// Helper to find text in a snackbar
Finder findInSnackBar(String text) => find.descendant(
  of: find.byType(SnackBar),
  matching: find.text(text),
);