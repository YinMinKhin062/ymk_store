import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ymk_store/features/auth/controllers/onboardingController.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';


import '../../../common/widgets/onboardingWidget/onBoardingContent.dart';
import '../../../common/widgets/onboardingWidget/onBoardingNavigator.dart';
import '../../../common/widgets/onboardingWidget/onBoardingNext.dart';
import '../../../common/widgets/onboardingWidget/onBoardingSkip.dart';
import '../../../utils/constants/txtContents.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.updatePageIndicator(value);
          },
          children: const [
            OnBoardingContent(
                image: assetImage.onBoardingScreen1,
                title:TxtContents.onBoardTitle1,
                subtitle:TxtContents.onBoardSubtitleTitle1),
            OnBoardingContent(
                image: assetImage.onBoardingScreen2,
                title:TxtContents.onBoardTitle2,
                subtitle:TxtContents.onBoardSubtitleTitle2),
            OnBoardingContent(
                image: assetImage.onBoardingScreen3,
                title: TxtContents.onBoardTitle3,
                subtitle: TxtContents.onBoardSubtitleTitle3),
          ],
        ),
        const OnBoardingSkip(),
        const OnBoardingNavigator(),
        const OnBoardingNext(),
      ]),
    );
  }
}
