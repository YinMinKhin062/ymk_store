import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/homeWidget/circularIcon.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../controlllers/cartController.dart';
import '../../../models/productModel.dart';

class QuantityWithAddtoCart extends StatelessWidget {
  const QuantityWithAddtoCart({super.key});

  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    // controller.updateAlreadyAddedProductCount(product);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                color: Colors.grey,
                iconColor: Colors.white,
                onPressed: () => controller.productQuantityInCart.value < 1
                    ? null
                    : controller.productQuantityInCart.value -= 1,
              ),
              const SizedBox(
                width: Sizes.spaceBetween,
              ),
              Text(controller.productQuantityInCart.value.toString()),
              const SizedBox(
                width: Sizes.spaceBetween,
              ),
              CircularIcon(
                icon: Iconsax.add,
                color: Colors.black,
                iconColor: Colors.white,
                onPressed: () => controller.productQuantityInCart.value += 1,
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          // () => controller.productQuantityInCart.value < 1
          //     ? null
          //     : controller.addToCart(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(
                Sizes.md,
              ),
              backgroundColor: Colors.black,
              side: const BorderSide(color: Colors.black)),
          child: const Text(TxtContents.addToCartTxt),
        ),
      ],
    );
  }
}
