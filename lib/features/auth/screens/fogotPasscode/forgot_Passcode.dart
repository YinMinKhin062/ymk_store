import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/auth/screens/fogotPasscode/resetPassword.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';

class ForgotPasscode extends StatefulWidget {
  const ForgotPasscode({super.key});

  @override
  State<ForgotPasscode> createState() => _ForgotPasscodeState();
}

class _ForgotPasscodeState extends State<ForgotPasscode> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Text(
                TxtContents.forgotPwd,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBetween,
              ),
              Text(
                TxtContents.forgotPwdTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: TxtContents.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                  const SizedBox(
                    height: Sizes.inputFieldSpaces,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(const ResetPassword());
                        },
                        child: const Text(TxtContents.submitBtnTxt)),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
