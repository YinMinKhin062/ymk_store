import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
import 'package:ymk_store/data/repositories/user/user_repositories.dart';
import 'package:ymk_store/features/auth/models/user/userModel.dart';
import 'package:ymk_store/features/auth/screens/SignUp/verifyEmail.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';
import 'package:ymk_store/utils/networkConnection/networkManager.dart';
import 'package:ymk_store/utils/popup/fullScreenLoader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables
  final isHidePassword = true.obs;
  final isChecked = true.obs;
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void signUp() async {
    try {
      //start loading
      // FullScreenLoader.openLoadingDialog("Loading...", assetImage.loading1);

      //check internet connectivity
      final isConntected = await NetworkManager.instance.isConnected();
      if (!isConntected) {
        // FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signUpFormKey.currentState!.validate()) {
       
        //privacy policy
        return;
      }

       if (!isChecked.value) {
          Loaders.warningSnackBar(
              title: "Accept Privacy Policy",
              message:
                  "In order to create account, you must read and accept privacy policy.");

          return;
        }

      //sigup with email and password
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          userName: username.text.trim(),
          email: email.text.trim(),
          phoneno: phoneno.text.trim(),
          profilepic: '');

      //add user data to firebase
      final userRepositories = Get.put(UserRepositories());
      await userRepositories.addUser(newUser);

      // FullScreenLoader.stopLoading();

      //show success msg
      Loaders.successSnackBar(
          title: "Congratulations!", message: "Your account has been created");

      Get.to(() => VeriyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    } finally {
      // FullScreenLoader.stopLoading();
    }
  }
}
