import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/features/auth/screens/SignUp/successScreen.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../../shop/screens/product details/productWidgets/bottomAddToCart.dart';
import '../cart/widgets/cartItemList.dart';
import 'widgets/billAddressSection.dart';
import 'widgets/billAmountSection.dart';
import 'widgets/billPaymentSection.dart';
import 'widgets/couponRow.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TxtContents.checkOutTxt,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: BottomAddToCart(
          child: Column(
        children: [
          //checkout btn
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SuccesScreen(image: assetImage.orderSuccessImg, title: 'Successfully Ordered', subtitle: 'Your order has been placed',));
                  },
                  child: const Text(TxtContents.placeOrderTxt)))
        ],
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              //cart item lists
              const CartItemList(
                showQuantityBtn: false,
                showContainerBorder: false,
                cartItemSpacer: Sizes.spaceBetween,
              ),

              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),

              //coupon
              const CouponRow(),

              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),

              //billing section
              CircularContainer(
                showBorder: true,
                padding: const EdgeInsets.all(Sizes.md),
                radius: Sizes.sm,
                child: Column(
                  children: const [
                    //pricing
                    BillAmountSection(),
                    SizedBox(
                      height: Sizes.spaceBetween/2,
                    ),

                    //divider
                    Divider(),
                    SizedBox(
                      height: Sizes.sm/3,
                    ),

                    //payment
                    BillPaymentSection(),
                    SizedBox(
                      height: Sizes.spaceBetween/2,
                    ),

                    //address
                    BillAddressSection(),
                    SizedBox(
                      height: Sizes.spaceBetween,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
