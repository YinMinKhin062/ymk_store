import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
import 'package:ymk_store/utils/networkConnection/networkManager.dart';

import '../../../../utils/networkConnection/loaders.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final isHidePassword = true.obs;
  final isCheckedRememberme = false.obs;
  final localStorage=GetStorage();

  GlobalKey<FormState> SignInFormKey = GlobalKey<FormState>();

  void onInit(){
    super.onInit();
    email.text=localStorage.read('Remember_me_email')?? '';
    password.text=localStorage.read('Remember_me_password')?? '';
  }

  void SignIn() async {
    //internet connection check
    try {
      final isConnected = await NetworkManager.instance.isConntected();
      if (!isConnected) {
        return;
      }

      //form validation
      if (!SignInFormKey.currentState!.validate()) {
        return;
      }

      if(isCheckedRememberme.value){
        localStorage.write('Remember_me_email', email.text.trim());
        localStorage.write('Remember_me_password', password.text.trim());
      }

   final userCredential  = await AuthenticationRepository.instance.logInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }
}
