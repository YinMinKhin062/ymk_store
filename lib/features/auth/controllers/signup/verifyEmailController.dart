import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_Repository.dart';
import '../../../../utils/constants/txtContents.dart';
import '../../../../utils/constants/assetImage.dart';
import '../../../../utils/networkConnection/loaders.dart';
import '../../screens/SignUp/successScreen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  void onInit() {
    super.onInit();
    sendEmailVerification(); //send email
    setTimerforAutoRedirect(); //set timer for email verification check, and then automatically sent to another page
  }

  //send email
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: "Email has already sent",
          message: "Please cheack your email and verify your email");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //set timer for email verification check, and then automatically sent to another page
  setTimerforAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccesScreen(
              image: assetImage.successfullyCreateAcc,
              subtitle: TxtContents.successSubttile,
              title: TxtContents.successTxt,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  //manually check email verification
  checkEmailVerificationStatus() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null || user!.emailVerified) {
      Get.off(() => SuccesScreen(
            image: assetImage.successfullyCreateAcc,
            subtitle: TxtContents.successSubttile,
            title: TxtContents.successTxt,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
