import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

final authClient = _AuthClient();

class _AuthClient {
  _AuthClient() {
    _setupListeners();
  }

  void _setupListeners() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('authStateChanges: User is currently signed out!');
      } else {
        print('authStateChanges: User is signed in!');
      }
    });
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('idTokenChanges: User is currently signed out!');
      } else {
        print('idTokenChanges: User is signed in!');
      }
    });
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('userChanges: User is currently signed out!');
      } else {
        print('userChanges: User is signed in!');
      }
    });
  }

  Future<void> signIn(
    String email,
    String password,
    Function(FirebaseSignInErrorCode) onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      var code = FirebaseSignInErrorCode.unknown;
      if (e.code == 'user-not-found') {
        code = FirebaseSignInErrorCode.userNotFound;
      } else if (e.code == 'wrong-password') {
        code = FirebaseSignInErrorCode.wrongPassword;
      }
      onError(code);
    }
  }

  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
        // TODO: Change with uploaded photo url.
        await FirebaseAuth.instance.currentUser!.updatePhotoURL(
          'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg',
        );
      }
    } catch (e) {
      log('e');
    }
  }
}

enum FirebaseSignInErrorCode {
  userNotFound,
  wrongPassword,
  unknown,
}
