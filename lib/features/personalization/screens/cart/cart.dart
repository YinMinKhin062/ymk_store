import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/personalization/screens/checkout/checkout.dart';
import 'package:ymk_store/features/shop/controlllers/cartController.dart';
import 'package:ymk_store/features/shop/controlllers/checkoutController.dart';
import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/bottomAddToCart.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/popup/animationLoaderWidget.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../controllers/addressController.dart';
import 'widgets/cartItemList.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
   
  
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Cart"),
        showBackArrow: true,
      ),
      bottomNavigationBar: BottomAddToCart(
          height: 120,
          child: Column(
            children: [
              //Total text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Obx(
                    ()=> Text(
                      "\$ ${controller.totalCartPrice.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Sizes.md + 2,
              ),
              //checkout btn
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const Checkout());
                      },
                      child: const Text(TxtContents.checkOutTxt)))
            ],
          )),
      body: Obx(() {
        final emptyWidget = AnimationLoaderWidget(
          width: 150,
          height: 150,
            animation: assetImage.cartempty,
            showAction: true,
            actionText: "Let's Shop",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
            text: 'Woops! Cart is empty!');

        if (controller.cartItems.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[ Center(child: emptyWidget)]);
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Sizes.defaultSpace),
              child: CartItemList(),
            ),
          );
        }
      }),
    );
  }
}
