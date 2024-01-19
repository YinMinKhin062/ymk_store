import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/styles/spacingStyles.dart';
import 'package:ymk_store/features/auth/screens/loginScreen.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../controllers/signin/forgotPwdController.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(forgotPwdController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              //image
              Image(
                image: const AssetImage(assetImage.verifyEmail),
                width: MediaQuery.of(context).size.width * .6,
              ),
              //reset pwd title
              Text(
                TxtContents.resetPwdTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Sizes.inputFieldSpaces,
              ),

              //mail address
              Text(
                email,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Sizes.inputFieldSpaces,
              ),

              //reset pwd subtitle
              Text(
                TxtContents.resetPwdSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const Login());
                    },
                    child: const Text(TxtContents.btnDoneTxt)),
              ),
              const SizedBox(
                height: Sizes.inputFieldSpaces,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      forgotPwdController.instance.resendResetPwdEmail(email);
                    },
                    child: const Text(TxtContents.btnResendMailTxt)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
