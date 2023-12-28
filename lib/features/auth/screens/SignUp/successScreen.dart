import 'package:flutter/material.dart';
import 'package:ymk_store/common/styles/spacingStyles.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';


import '../../../../utils/constants/txtContents.dart';

class SuccesScreen extends StatelessWidget {
  const SuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: SpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            //image
            Image(
              image: const AssetImage(assetImage.successfullyCreateAcc),
              width: MediaQuery.of(context).size.width * .9,
            ),
            // const SizedBox(
            //   height: Sizes.inputFieldSpaces,
            // ),
            //Verify Text
            Text(
              TxtContents.successTxt,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            // const SizedBox(
            //   height: Sizes.spaceBetween,
            // ),
            // Text(
            //   TxtContents.successTitle,
            //   style: Theme.of(context).textTheme.labelLarge,
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(
              height: Sizes.spaceBetween,
            ),
            Text(
              TxtContents.successSubttile,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Sizes.spaceBetweenSections,
            ),
            //Btn
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(TxtContents.continueTxt))),
          ],
        ),
      )),
    );
  }
}
