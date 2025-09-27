import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      userCode: data['code'] as String,
      isAdmin: data['isAdmin'] as bool? ?? false,
    );
  }

  Future<UserModel?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user == null) return null;


      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (!doc.exists) {
        await signOut();
        return null;
      }

      final data = doc.data()!;
      return UserModel(
        uid: user.uid,
        email: user.email ?? data['email'] as String,
        displayName: user.displayName ?? data['displayName'] as String?,
        userCode: data['code'] as String,
        isAdmin: data['isAdmin'] as bool? ?? false,
      );
    } catch (e) {
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