import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';

import 'animationLoaderWidget.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // for overlay dialogs
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: Colors.grey.withOpacity(.2),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              AnimationLoaderWidget(
                text: text,
                animation:animation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
