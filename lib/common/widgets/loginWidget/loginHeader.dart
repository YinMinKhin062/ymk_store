import 'package:flutter/material.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:const [
          SizedBox(
          height: Sizes.spaceBetweenSections*1.5,
        ),
         Image(
            width: 170,
             height: 100, 
             image: AssetImage(assetImage.signinLogo)),
             SizedBox(
          height: Sizes.spaceBetweenSections,
        ),
        // Text(
        //   TxtContents.title,
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
        // const SizedBox(
        //   height: Sizes.sm,
        // ),
        // Text(
        //   TxtContents.subtitle,
        //   style: Theme.of(context).textTheme.bodyMedium,
        // ),
        // const SizedBox(
        //   height: Sizes.spaceBetweenSections,
        // ),
      ],
    );
  }
}
