import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/auth/controllers/signin/signInController.dart';
import 'package:ymk_store/features/auth/screens/fogotPasscode/forgot_Passcode.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:ymk_store/utils/validators/validation.dart';

import '../../../features/auth/screens/SignUp/signupScreen.dart';
import '../../../utils/constants/txtContents.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // bool isHidePassword = true;
  // bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Form(
      key: controller.SignInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.email,
            validator: (emailValue) => MyValidator.validateEmail(emailValue),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TxtContents.lbEmailTxt,
            ),
          ),
          const SizedBox(
            height: Sizes.inputFieldSpaces,
          ),
          //password
          Obx(
            () => TextFormField(
              obscureText: controller.isHidePassword.value,
              controller: controller.password,
              validator: (pwdValue) => MyValidator.validationEmptyText('Password',pwdValue),
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
            height: Sizes.inputFieldSpaces / 2,
          ),
          // Remember me checkbox & forget passcode
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Row(
                  children: [
                    //Remember me
                    Checkbox(
                      // side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: Colors.grey,width: 2)),
                      value: controller.isCheckedRememberme.value,
                      onChanged: (value) {
                        // setState(() {
                        controller.isCheckedRememberme.value = value!;
                        // });
                      },
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // setState(() {
                        controller.isCheckedRememberme.value =
                            !controller.isCheckedRememberme.value;
                        // });
                      },
                      // child: const Flexible(
                      child: Text(
                        TxtContents.rememberMe,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.deepPurple),
                      ),
                      // )
                    )
                  ],
                ),
              ),

              //forgot Passcode
              Flexible(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.to(const ForgotPasscode());
                  },
                  child: Text(
                    TxtContents.forgotPwd,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Sizes.inputFieldSpaces / 2,
          ),

          //signin Btn
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.SignIn();
                    // Get.to(const NavigationMenu());
                  },
                  child: const Text(
                    TxtContents.btnSigninTxt,
                  ))),
          const SizedBox(
            height: Sizes.spaceBetween,
          ),
          //create acc btn
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen());
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  },
                  child: const Text(
                    TxtContents.btnCreateAccTxt,
                  ))),
          const SizedBox(
            height: Sizes.spaceBetweenSections,
          ),
        ],
      ),
    );
  }
}
