import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/data/repositories/Order/orderRepository.dart';
import 'package:ymk_store/features/auth/screens/SignUp/successScreen.dart';
import 'package:ymk_store/features/personalization/controllers/addressController.dart';
import 'package:ymk_store/features/shop/controlllers/checkoutController.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/enum.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/PriceCalculator.dart';

import '../../../../utils/networkConnection/loaders.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../../shop/controlllers/cartController.dart';
import '../../../shop/screens/product details/productWidgets/bottomAddToCart.dart';
import '../../controllers/orderController.dart';
import '../cart/widgets/cartItemList.dart';
import 'widgets/billAddressSection.dart';
import 'widgets/billAmountSection.dart';
import 'widgets/billPaymentSection.dart';
import 'widgets/couponRow.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final totalAmount = PriceCalculator.calculateTotalPrice(
            subTotal, "ShippingTownships.yangon")
        .toStringAsFixed(2);
    final orderController =Get.put(OrderController());
  
  

    return Scaffold(
      appBar: AppBar(
        title: Text(
          TxtContents.checkOutTxt,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Container(
          height: 82,
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
          child: Column(
            children: [
              //checkout btn
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: subTotal > 0
                          ? () {
                              orderController
                                  .processingOrder(double.parse(totalAmount));
                            }
                          : Loaders.warningSnackBar(
                              title: 'Empty Cart',
                              message: 'Add items in cart to proceed'),
                      child:
                          Text("${TxtContents.placeOrderTxt} \$$totalAmount")))
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
                      height: Sizes.spaceBetween / 2,
                    ),

                    //divider
                    Divider(),
                    SizedBox(
                      height: Sizes.sm / 3,
                    ),

                    //payment
                    BillPaymentSection(),
                    SizedBox(
                      height: Sizes.spaceBetween / 2,
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
