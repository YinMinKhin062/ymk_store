import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ymk_store/features/auth/controllers/onboardingController.dart';

class OnBoardingNavigator extends StatelessWidget {
  const OnBoardingNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingController.instance;

    return Positioned(
      bottom: kBottomNavigationBarHeight,
      left: 24,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked:(index) {
          controller.dotNavigationClick(index);
        }, 
        count: 3,
      effect: const ExpandingDotsEffect(activeDotColor: Colors.red,dotHeight: 6),),
    );
  }
}