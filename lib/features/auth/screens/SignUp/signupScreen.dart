import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/loginWidget/dividerContent.dart';
import 'package:ymk_store/common/widgets/loginWidget/loginFooter.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../common/widgets/signUpWidget/signupForm.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TxtContents.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(
                  height: Sizes.spaceBetweenSections,
                ),

                //signUp Form
                const SignUpForm(),

                //divider
                const DividerContent(
                  dividerTxt: TxtContents.txtOtherSignUp,
                ),

                const SizedBox(
                  height: Sizes.spaceBetweenSections,
                ),
                const LoginFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
