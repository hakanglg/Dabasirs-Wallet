// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../core/util/snackar/show_snackbar.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/service/firebase_firestore_service.dart';

class FirebaseAuthService {
  FirebaseAuthService(this._auth);
  final FirebaseAuth _auth;

  bool isLogged = false;

  User get user => _auth.currentUser!;

  // STATE PERSISTENCE
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  // AUTHENTICATION ANON

  Future<User?> signInAnon() async {
    final UserCredential userCredential = await _auth.signInAnonymously();

    return userCredential.user;
  }

  // SIGN OUT

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      showSnackBarSuccess(context, LocaleKeys.snackbar_signOutSuccess.tr());
    } on FirebaseAuthException catch (e) {
      showSnackBarError(context, e.message!);
    }
  }

  // REGISTER WITH EMAIL AND PASSWORD

  Future<User?> signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _auth.currentUser!.updateDisplayName(name);
      User? user = userCredential.user;
      await context.read<FireStoreService>().addUserToDB(user, name: name);

      if (user!.emailVerified == false) {
        await sendEmailVerification(context);
      }

      // TODO navigate to home screen
      _auth.signOut();
      return user;
    } on FirebaseAuthException catch (e) {
      showSnackBarInfo(context, e.message!);
    }
    return null;
  }

  // LOGIN WITH EMAIL
  Future<User?> loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      showSnackBarError(context, e.message!);
    }
    return null;
  }

  // GOOGLE SIGN IN
  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        User? user = userCredential.user;
        await context.read<FireStoreService>().addUserToDB(user);
        return user;

        // * ADD USER TO FIRESTORE

      }
    } on FirebaseAuthException catch (e) {
      showSnackBarError(context, e.message!);
    }
    return null;
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBarInfo(context, LocaleKeys.snackbar_emailVerification.tr());
    } on FirebaseAuthException catch (e) {
      showSnackBarError(context, e.message!);
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await context.read<FireStoreService>().deleteUser(_auth.currentUser!);

      _auth.currentUser!.delete();
      showSnackBarSuccess(
          context, LocaleKeys.snackbar_deleteAccountSuccess.tr());
    } on FirebaseAuthException catch (e) {
      showSnackBarError(context, e.message!);
    }
  }
}
