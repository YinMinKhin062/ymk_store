import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/features/shop/controlllers/homeController.dart';

import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';

class HomePromoSlider extends StatelessWidget {
  final List<String> banners;
  const HomePromoSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners
                .map((url) => CurvedImage(
                    imgBorderRadius: Sizes.md,
                    isNetworkImg: true,
                    imgPath: url))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  controller.updatePageIndicator(index),
            )),
        const SizedBox(
          height: Sizes.spaceBetween,
        ),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    bgColor: controller.currentIndex.value == i
                        ? Colors.deepPurple
                        : Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
