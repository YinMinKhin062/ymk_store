import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/auth/screens/fogotPasscode/forgot_Passcode.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:flutter/cupertino.dart';


import '../../../features/auth/screens/SignUp/signupScreen.dart';
import '../../../utils/constants/txtContents.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isHidePassword = true;
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TxtContents.lbEmailTxt,
            ),
          ),
          const SizedBox(
            height: Sizes.inputFieldSpaces,
          ),
          TextFormField(
            obscureText: isHidePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              labelText: TxtContents.lbPwdTxt,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isHidePassword = !isHidePassword;
                    });
                  },
                  child: isHidePassword
                      ? const Icon(
                          Iconsax.eye_slash,
                        )
                      : const Icon(Iconsax.eye)),
            ),
          ),
          const SizedBox(
            height: Sizes.inputFieldSpaces / 2,
          ),
          // Remember me checkbox & forget passcode
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //Remember me
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      // child: const Flexible(
                        child:  Text(
                          TxtContents.rememberMe,
                          style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.deepPurple),
                          
                        ),
                      // )
                      )
                ],
              ),

              //forgot Passcode
              Flexible(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.to(const ForgotPasscode());
                    }, child:  Text(TxtContents.forgotPwd,style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.deepPurple),),),
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
                    Get.to(const NavigationMenu());
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
                    Get.to(()=>const SignUpScreen());
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
