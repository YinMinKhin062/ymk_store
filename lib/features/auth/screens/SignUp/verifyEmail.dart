import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/auth/screens/SignUp/successScreen.dart';
import 'package:ymk_store/features/auth/screens/loginScreen.dart';

import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';

class VeriyEmailScreen extends StatelessWidget {
  const VeriyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(const Login());
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(assetImage.verifyEmail),
                width: MediaQuery.of(context).size.width * .6,
              ),
              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),
              Text(
                TxtContents.verifyEmailTxt,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBetween,
              ),
              Text(
                "yinminkhin98@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBetween,
              ),
              Text(
                TxtContents.emailAwaitTxt,
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
                        Get.to(const SuccesScreen(image: assetImage.successfullyCreateAcc, subtitle: TxtContents.successSubttile, title: TxtContents.successTxt,));
                      },
                      child: const Text(TxtContents.continueTxt))),
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
                      onPressed: () {},
                      child: const Text(TxtContents.resendEmailTxt))),
            ],
          ),
        ),
      ),
    );
  }
}
