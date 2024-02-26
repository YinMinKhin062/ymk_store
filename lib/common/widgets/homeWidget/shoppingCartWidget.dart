import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/personalization/screens/cart/cart.dart';

import '../../../features/shop/controlllers/cartController.dart';


class ShoppingCartWidget extends StatelessWidget {
  // final VoidCallback onPressed;
  final Color iconColor;
  const ShoppingCartWidget(
      {super.key, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CartController());
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(()=> const Cart()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Obx(
              ()=> Text(
                controller.noOfCartItems.value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
