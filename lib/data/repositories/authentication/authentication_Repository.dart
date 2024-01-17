import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/features/auth/controllers/signup/verifyEmailController.dart';
import 'package:ymk_store/features/auth/screens/SignUp/verifyEmail.dart';
import 'package:ymk_store/features/auth/screens/loginScreen.dart';
import 'package:ymk_store/features/auth/screens/onboarding.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:ymk_store/utils/exception/MyFirebaseAuthException.dart';

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
      if (user.emailVerified) {
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
    } on PlatformException catch (e) {
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
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Pleae try again';
    }
  }

  //signout
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Pleae try again';
    }
  }
}