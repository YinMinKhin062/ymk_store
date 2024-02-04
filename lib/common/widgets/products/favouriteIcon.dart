import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/controlllers/product/favouriteController.dart';

import '../homeWidget/circularIcon.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key,required this.productId});

final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      ()=> CircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        iconColor:controller.isFavourite(productId)? Colors.red: null,
        showBorder: false,
        onPressed: () {
          controller.toggleFavouriteProduct(productId);
        },
      ),
    );
  }
}
