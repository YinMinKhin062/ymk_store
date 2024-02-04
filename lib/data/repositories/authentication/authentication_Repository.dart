import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ymk_store/data/repositories/user/user_repositories.dart';
import 'package:ymk_store/features/auth/screens/SignUp/verifyEmail.dart';
import 'package:ymk_store/features/auth/screens/loginScreen.dart';
import 'package:ymk_store/features/auth/screens/onboarding.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:ymk_store/utils/exception/MyFirebaseAuthException.dart';

import '../../../utils/localStorage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user =
        _auth.currentUser; //if you are sure the user is currently signed-in
    if (user != null) {
      //if user is logged in
      if (user.emailVerified) {
        //initialize user specific storage
        await LocalStorage.init(user.uid);

        //if user is verified, navigate to home screen
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VeriyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else if (user == null) {
      Get.offAll(() => const Login());
    } else {
      //local storage
      if (kDebugMode) {
        print("=== Get Storage Auth Repo");
        print(deviceStorage.read('IsFirstTime'));
      }

      //local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const Login())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  User get authUser => FirebaseAuth.instance.currentUser!;

  // =========== Email Sign-In===========

  //email signin
  Future<UserCredential> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //email register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Pleae try again';
    }
  }

  //password reset
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //google authentication
  Future<UserCredential> logInWithGoogle() async {
    try {
      //trigger auth flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      //obtain auth details from request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      //create new credential
      final credentail = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      // return user credential
      return await _auth.signInWithCredential(credentail);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //signout
  Future<void> logOut() async {
    try {
      // await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const Login());
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Pleae try again';
    }
  }

  //delete account
  Future<void> deleteAccount() async {
    try {
      await UserRepositories.instance.removeUser(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();

      Get.offAll(() => const Login());
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Pleae try again';
    }
  }

  //reauthenticate
  Future<void> reauthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
