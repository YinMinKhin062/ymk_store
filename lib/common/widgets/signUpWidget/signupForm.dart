import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/signUpWidget/termsAndConditions.dart';
import 'package:ymk_store/features/auth/controllers/signup/signupController.dart';
import 'package:ymk_store/utils/validators/validation.dart';

import '../../../utils/constants/txtContents.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
        key: controller.signUpFormKey,
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //         child: TextFormField(
            //       expands: false,
            //       decoration: const InputDecoration(
            //           isDense: true,
            //           contentPadding: EdgeInsets.all(10),
            //           labelText: TxtContents.fistName,
            //           prefixIcon: Icon(Iconsax.user)),
            //     )),
            //     const SizedBox(
            //       width: Sizes.inputFieldSpaces,
            //     ),
            //     Expanded(
            //         child: TextFormField(
            //       expands: false,
            //       decoration: const InputDecoration(
            //           isDense: true,
            //           contentPadding: EdgeInsets.all(10),
            //           labelText: TxtContents.lastName,
            //           prefixIcon: Icon(Iconsax.user)),
            //     )),
            //   ],
            // ),
            // const SizedBox(height: Sizes.spaceBetween),

            //user name
            TextFormField(
              controller: controller.username,
              validator: (userNameValue) =>
                  MyValidator.validationEmptyText('User Name', userNameValue),
              decoration: const InputDecoration(
                  labelText: TxtContents.userName,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: Sizes.spaceBetween),

            //Email
            TextFormField(
              controller: controller.email,
              validator: (emailValue) => MyValidator.validateEmail(emailValue),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: TxtContents.email,
                  prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: Sizes.spaceBetween),

            //Phoneno
            TextFormField(
              controller: controller.phoneno,
              validator: (phoneNoValue) =>
                  MyValidator.validatePhoneno(phoneNoValue),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: TxtContents.phoneNo,
                  prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: Sizes.spaceBetween),

            //password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (passwordValue) =>
                    MyValidator.validatePassword(passwordValue),
                obscureText: controller.isHidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TxtContents.lbPwdTxt,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        // setState(() {
                        controller.isHidePassword.value =
                            !controller.isHidePassword.value;
                        // });
                      },
                      child: controller.isHidePassword.value
                          ? const Icon(
                              Iconsax.eye_slash,
                            )
                          : const Icon(Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBetween,
            ),

            //agree terms and conditions checkbox
            const TermsAndConditionWidget(),
            const SizedBox(
              height: Sizes.spaceBetween,
            ),

            //sign up btn
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.signUp();
                    // Get.to(const VeriyEmailScreen());
                  },
                  child: const Text(TxtContents.btnSignUpTxt)),
            ),
            const SizedBox(
              height: Sizes.spaceBetweenSections,
            )
          ],
        ));
  }
}
