import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/signUpWidget/termsAndConditions.dart';

import '../../../features/auth/screens/SignUp/verifyEmail.dart';
import '../../../utils/constants/txtContents.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
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
          decoration: const InputDecoration(
              labelText: TxtContents.userName,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: Sizes.spaceBetween),

        //Email
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              labelText: TxtContents.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: Sizes.spaceBetween),

        //Phoneno
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
              labelText: TxtContents.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: Sizes.spaceBetween),

        //password
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
                Get.to(const VeriyEmailScreen());
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
