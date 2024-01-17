import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/features/auth/screens/loginScreen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController(initialPage: 0);

  int currentPageindex = 0;

  //Update current index when page scroll
  void updatePageIndicator(index) {
    currentPageindex = index;
  }

  //jumpp to specific dot selected page
  void dotNavigationClick(index) {
    currentPageindex = index;

    pageController.jumpToPage(index);
  }

  //go to next page
  void nextPage() {
    if (currentPageindex == 2) {
      final storage = GetStorage();
      if (kDebugMode) {
        print("==Get Storage Next Btn==");
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);
      Get.offAll(() => const Login());
    } else {
      pageController.jumpToPage(currentPageindex + 1);
    }
  }

  //skipping
  void skipPage() {
    currentPageindex = 2;
    pageController.jumpToPage(currentPageindex);
  }
}
