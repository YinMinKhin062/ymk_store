import 'package:flutter/material.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon:const  Image(
                              width: 25,
                              height: 25,
                              image: AssetImage(assetImage.gLogo))),
                    ),
                  ),
                  const SizedBox(
                    width: Sizes.spaceBetween,
                  ),
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