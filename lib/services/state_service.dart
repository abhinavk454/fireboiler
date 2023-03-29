import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApplicationState extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;
  Logger logger = Logger();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  ApplicationState() {
    _auth.authStateChanges().listen(_onAuthStateChange);
  }

  Future<void> _onAuthStateChange(User? user) async {
    _user = user;
    logger.d(user, _user);
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      logger.e(
        e,
      );
    }
  }

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      logger.e(
        e,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      logger.e(
        e,
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      try {
        await _auth.signInWithCredential(
          credential,
        );
      } catch (e) {
        logger.e(
          e,
        );
      }
    } catch (e) {
      logger.e(
        e,
      );
    }
  }

  Future<void> updateName(String displayName) async {
    try {
      await _user!.updateDisplayName(
        displayName,
      );
    } catch (e) {
      logger.e(
        e,
      );
    }
  }
}
