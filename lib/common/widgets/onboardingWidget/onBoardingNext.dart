import 'package:flutter/material.dart';
import 'package:ymk_store/features/auth/controllers/onboardingController.dart';

class OnBoardingNext extends StatelessWidget {
  const OnBoardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 24,
        bottom: kBottomNavigationBarHeight,
        child: ElevatedButton(
          onPressed: () {
            OnBoardingController.instance.nextPage();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: const CircleBorder(side: BorderSide.none),
              side: const BorderSide(color: Colors.red)),
          child: const Icon(
            Icons.arrow_forward_ios,
          ),
        ));
  }
}
