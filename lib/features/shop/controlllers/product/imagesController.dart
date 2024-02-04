import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString currentProductImage = "".obs;

//get all images from product and variations
  List<String> getProductImages(ProductModel product) {
    //use set to add unique images
    Set<String> images = {};

    images.add(product.thumbnail);

    //set as thumbnail image as selectedimg
    currentProductImage.value = product.thumbnail;

    if (product.images != null) {
      images.addAll(product.images!);
    }

    // if (product.productVariations != null ||
    //     product.productVariations!.isNotEmpty) {
      
    //   product.productVariations!.map((variation) {
    //     if(variation.image!=null){
    //       images.add(variation.image!);
    //     }
    //   });
    //   // images.addAll(
    //   //     product.productVariations!.map((variation) => variation.image!));
    // }

    return images.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Iconsax.close_circle,
                      size: Sizes.spaceBetweenSections-2,
                    ))
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Sizes.defaultSpace * 2,
                    horizontal: Sizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image)),
          ],
        ),
      ),
    );
  }
}
