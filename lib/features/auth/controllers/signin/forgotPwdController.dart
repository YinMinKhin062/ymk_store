import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
import 'package:ymk_store/features/auth/screens/fogotPasscode/resetPassword.dart';
import 'package:ymk_store/utils/networkConnection/networkManager.dart';

import '../../../../utils/networkConnection/loaders.dart';

class forgotPwdController extends GetxController {
  static forgotPwdController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPwdformKey = GlobalKey<FormState>();

  //send reset Pwd email
  sendPwdResetEmail() async {
    //form validation
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (forgotPwdformKey.currentState!.validate()) {
         //send pwd reset email
        await AuthenticationRepository.instance
            .sendPasswordResetEmail(email.text.trim());

        Loaders.successSnackBar(
            title: "Email Sent",
            message: "Password reset email is sent. Please check the email.");


          Get.to(() => ResetPassword(email: email.text.trim()));
        return;
      }

     

    
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //resend reset pwd email
  resendResetPwdEmail(String email) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      //send pwd reset email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      Loaders.successSnackBar(
          title: "Email Sent",
          message: "Password reset email is sent. Please check the email.");
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
