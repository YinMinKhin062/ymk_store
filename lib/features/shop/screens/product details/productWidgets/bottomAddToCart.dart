import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/controlllers/cartController.dart';

import '../../../../../common/widgets/homeWidget/circularIcon.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../models/productModel.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({
    super.key,
    this.child,
    this.height = 82,
  });

  final Widget? child;
  final double height;

  @override
  Widget build(BuildContext context) {
    // final controller = CartController.instance;
    // controller.updateAlreadyAddedProductCount(product!);
    return Container(
      height: height,
      // alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.defaultSpace, vertical: Sizes.defaultSpace / 2),
      decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(.1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(7, 0),
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Sizes.cardRadiusLg),
            topRight: Radius.circular(Sizes.cardRadiusLg),
          )),
      child: child,
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Obx(
      //       ()=> Row(
      //         children: [
      //           CircularIcon(
      //             icon: Iconsax.minus,
      //             color: Colors.grey,
      //             iconColor: Colors.white,
      //             onPressed: () => controller.productQuantityInCart.value < 1
      //                 ? null
      //                 : controller.productQuantityInCart.value -= 1,
      //           ),
      //           const SizedBox(
      //             width: Sizes.spaceBetween,
      //           ),
      //           Text(controller.productQuantityInCart.value.toString()),
      //           const SizedBox(
      //             width: Sizes.spaceBetween,
      //           ),
      //           CircularIcon(
      //             icon: Iconsax.add,
      //             color: Colors.black,
      //             iconColor: Colors.white,
      //             onPressed: () => controller.productQuantityInCart.value += 1,
      //           ),
      //         ],
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () => controller.productQuantityInCart.value<1? null: controller.addToCart(product),
      //       style: ElevatedButton.styleFrom(
      //           padding: const EdgeInsets.all(
      //             Sizes.md,
      //           ),
      //           backgroundColor: Colors.black,
      //           side: const BorderSide(color: Colors.black)),
      //       child: const Text(TxtContents.addToCartTxt),
      //     ),
      //   ],
      // ),
    );
  }
}
