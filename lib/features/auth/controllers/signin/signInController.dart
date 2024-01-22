import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/networkConnection/networkManager.dart';
import 'package:ymk_store/utils/popup/fullScreenLoader.dart';

import '../../../../utils/networkConnection/loaders.dart';
import '../../../personalization/controllers/userController.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final isHidePassword = true.obs;
  final isCheckedRememberme = false.obs;
  final localStorage = GetStorage();

  final userController = Get.put(UserController());

  GlobalKey<FormState> SignInFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('Remember_me_email') ?? '';
    password.text = localStorage.read('Remember_me_password') ?? '';
  }

  //signin with email & pwd
  void signIn() async {
    //start loading
    FullScreenLoader.openLoadingDialog("Loading...", assetImage.loading1);

    //internet connection check
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!SignInFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (isCheckedRememberme.value) {
        localStorage.write('Remember_me_email', email.text.trim());
        localStorage.write('Remember_me_password', password.text.trim());
      }
      // else{
      //   localStorage.write('Remember_me_email', '');
      //   localStorage.write('Remember_me_password', '');
      // }

      //signin with email & pwd
      final userCredential = await AuthenticationRepository.instance
          .logInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim());

      FullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog("Loading...", assetImage.loading1);

      //connection check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //sigin with google
      final userCredential =
          await AuthenticationRepository.instance.logInWithGoogle();

      //store user credential
      userController.addUserRecord(userCredential);

      //after storing, stop loading
      FullScreenLoader.stopLoading();

      //screen redirect
      AuthenticationRepository.instance.screenRedirect();

      //store email and pwd in local storage
      localStorage.write('Remember_me_email', '');
      localStorage.write('Remember_me_password', '');
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
