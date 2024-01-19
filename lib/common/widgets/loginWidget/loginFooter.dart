import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/auth/controllers/signin/signInController.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignInController());
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google signin
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                          onPressed: () {
                              controller.googleSignIn();
                          },
                          icon:const  Image(
                              width: 25,
                              height: 25,
                              image: AssetImage(assetImage.gLogo))),
                    ),
                  ),
                  const SizedBox(
                    width: Sizes.spaceBetween,
                  ),
                  //facebook sigin
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          )),
                    ),
                  ),
                ],
              );
  }
}