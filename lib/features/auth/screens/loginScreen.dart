import 'package:flutter/material.dart';
import 'package:ymk_store/common/styles/spacingStyles.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';

import '../../../common/widgets/loginWidget/dividerContent.dart';
import '../../../common/widgets/loginWidget/loginFooter.dart';
import '../../../common/widgets/loginWidget/loginForm.dart';
import '../../../common/widgets/loginWidget/loginHeader.dart';
import '../../../utils/constants/txtContents.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // bool isHidePassword = true;
  // bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // logo, title & subtitle
              LoginHeader(),
              //endof Welcome title

              // Form
              LoginForm(),
              //endof Form

              // Divider
              DividerContent(dividerTxt: TxtContents.txtOtherSignIn,),
              //endof Diviver

              SizedBox(
                height: Sizes.spaceBetweenSections,
              ),

              //signin with other options
              LoginFooter(),
              //end of signin with other options
            ],
          ),
        )),
      ),
    );
  }
}
