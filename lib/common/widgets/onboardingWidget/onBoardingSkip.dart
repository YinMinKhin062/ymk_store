import 'package:flutter/material.dart';
import 'package:ymk_store/features/auth/controllers/onboardingController.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: kToolbarHeight,right: 24,
          child: TextButton(onPressed: (){
            OnBoardingController.instance.skipPage();
          }, child:const Text("Skip",style: TextStyle(color: Colors.grey),)));
  }
}