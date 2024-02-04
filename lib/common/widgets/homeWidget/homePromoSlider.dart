import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/features/shop/controlllers/bannerController.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';

import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';

class HomePromoSlider extends StatelessWidget {
  // final List<String> banners;
  const HomePromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // print("BANNERS ${controller.activeBanners}");
      if (controller.isLoading.value) {
        return const MyShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.activeBanners.isEmpty) {
        return const Text("No data found");
      } else {
        return Column(
          children: [
            CarouselSlider(
                items: controller.activeBanners
                    .map((activeBanner) => CurvedImage(
                          imgBorderRadius: Sizes.md,
                          isNetworkImg: true,
                          imgPath: activeBanner.imgUrl,
                          onTap: () => Get.toNamed(activeBanner.targetScreen),
                        ))
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
                  for (int i = 0; i < controller.activeBanners.length; i++)
                    CircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        bgColor: controller.carouselCurrentIndex.value == i
                            ? Colors.deepPurple
                            : Colors.grey),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}
