import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/personalization/screens/checkout/checkout.dart';
import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/bottomAddToCart.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import 'widgets/cartItemList.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    "Ks 4,000,000",
                    style: Theme.of(context).textTheme.titleLarge,
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
                        Get.to(()=>const Checkout());
                      },
                      child: const Text(TxtContents.checkOutTxt)))
            ],
          )),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: CartItemList(),
        ),
      ),
    );
  }
}
