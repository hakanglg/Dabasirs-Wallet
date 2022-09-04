import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../service/firebase_auth_service.dart';

enum AppState { LOADING, LOADED, ERROR }

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuthService _auth = FirebaseAuthService(FirebaseAuth.instance);

  AppState? _state;
  AppState? get state => _state;

  User get _currentUser => _auth.user;

  Future signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    var result = await _auth.signUpWithEmail(
        email: email, password: password, name: name, context: context);
    if (result is! User) {
      return null;
    }

    return User;
  }

  Future loginWithMail(
      String email, String password, BuildContext context) async {
    var result = await (_auth.loginWithEmail(
        email: email, password: password, context: context));

    if (result == null) {
      throw Exception("Login exception");
    }

    return User;
  }

  Future<Type> signInWithGoogle(BuildContext context) async {
    var result = await _auth.signInWithGoogle(context);

    if (result is! User) {}

    return User;
  }

  Future signOut(BuildContext context) async {
    await _auth.signOut(context);
  }
}
