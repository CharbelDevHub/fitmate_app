import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? _user;
  User? get currentUser => _user;

  AuthProvider() {
    // Listen to authentication state changes
    _firebaseAuth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners(); // Notify listeners when the user changes
    });
  }

  // Stream to listen to authentication state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Sign in with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Sign-in failed: $e');
    }
  }

  // Create a new user with email and password
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Sign-up failed: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}