import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/features/shop/controlllers/cartController.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';

import '../../../../../common/widgets/text/productPriceTxt.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import 'addRemoveItemFromCart.dart';
import 'cartItem.dart';

class CartItemList extends StatelessWidget {
  const CartItemList(
      {super.key,
      this.showQuantityBtn = true,
      this.showContainerBorder = true,
      this.cartItemSpacer = Sizes.spaceBetweenSections});

  final bool showQuantityBtn, showContainerBorder;
  final double cartItemSpacer;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, index) => SizedBox(
          height: cartItemSpacer,
        ),
        itemBuilder: (_, index) {
          return Obx(() {
            final cartItem = controller.cartItems[index];
            return CircularContainer(
              padding: showQuantityBtn
                  ? const EdgeInsets.only(
                      right: Sizes.md, top: Sizes.md, bottom: Sizes.md)
                  : EdgeInsets.zero,
              radius: Sizes.md,
              showBorder: showContainerBorder,
              child: Column(
                children: [
                  //cart item with image
                  CartItem(
                    cartItem: cartItem,
                  ),
                  if (showQuantityBtn)
                    const SizedBox(
                      height: Sizes.sm,
                    ),
                  if (showQuantityBtn)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //quatity btn

                        Row(
                          children: [
                            //  if(showQuantityBtn)
                            const SizedBox(
                              width: 75,
                            ),
                            //  if(showQuantityBtn)
                            AddRemoveItemFromCart(
                              quantity: cartItem.quantity,
                              add: () => controller.addOneToCart(cartItem),
                              remove: () =>
                                  controller.removeOneFromCart(cartItem),
                            ),
                          ],
                        ),
                        ProductPriceTxt(
                            currency: "\$",
                            price: (cartItem.price * cartItem.quantity)
                                .toStringAsFixed(2)),
                      ],
                    ),
                ],
              ),
            );
          });
        },
      );
    });
  }
}
