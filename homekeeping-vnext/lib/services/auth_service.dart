import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homekeeping/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserModel?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (!doc.exists) return null;

    final data = doc.data()!;
    return UserModel(
      uid: user.uid,
      email: user.email ?? data['email'] as String,
      displayName: user.displayName ?? data['displayName'] as String?,
      userCode: data['userCode'] as String,
      isAdmin: data['isAdmin'] as bool? ?? false,
    );
  }

  Future<UserModel?> signInWithGoogle() async {
    try {
      print('🔍 Step 1: Starting Google Sign-In...');
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('🔍 Step 1 FAILED: Google Sign-In cancelled');
        return null;
      }
      print('🔍 Step 1 SUCCESS: Got Google user: ${googleUser.email}');

      print('🔍 Step 2: Getting Google authentication...');
      final googleAuth = await googleUser.authentication;
      print('🔍 Step 2 SUCCESS: Got tokens - Access: ${googleAuth.accessToken != null}, ID: ${googleAuth.idToken != null}');
      
      print('🔍 Step 3: Creating Firebase credential...');
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print('🔍 Step 3 SUCCESS: Created Firebase credential');

      print('🔍 Step 4: Signing in to Firebase...');
      final userCredential = await _auth.signInWithCredential(credential);
      print('🔍 Step 4 SUCCESS: Firebase sign-in completed');
      
      final user = userCredential.user;
      if (user == null) {
        print('🔍 Step 4 FAILED: No user returned from Firebase');
        return null;
      }
      print('🔍 Step 4 SUCCESS: Got Firebase user: ${user.uid}');

      // Debug logging - multiple methods to ensure visibility
      print('🔍 DEBUG: User UID = ${user.uid}');
      print('🔍 DEBUG: User Email = ${user.email}');
      print('🔍 DEBUG: Looking for document at: users/${user.uid}');
      debugPrint('🔍 DEBUG: User UID = ${user.uid}');
      debugPrint('🔍 DEBUG: User Email = ${user.email}');
      
      // Show alert with UID for debugging - will definitely be visible
      // ignore: avoid_print
      print('🚨 ALERT: Your UID is: ${user.uid}');

      final doc = await _firestore.collection('users').doc(user.uid).get();
      print('🔍 DEBUG: Document exists = ${doc.exists}');
      
      if (!doc.exists) {
        print('🔍 DEBUG: No document found for UID ${user.uid}');
        await signOut();
        return null;
      }

      final data = doc.data()!;
      return UserModel(
        uid: user.uid,
        email: user.email ?? data['email'] as String,
        displayName: user.displayName ?? data['displayName'] as String?,
        userCode: data['userCode'] as String,
        isAdmin: data['isAdmin'] as bool? ?? false,
      );
    } catch (e, stackTrace) {
      print('🚨 ERROR in signInWithGoogle: $e');
      print('🚨 Stack trace: $stackTrace');
      await signOut();
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      // Ignore errors from mock in tests
    }
  }
}