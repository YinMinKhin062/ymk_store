import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';

import '../../../../../common/widgets/text/productPriceTxt.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import 'addRemoveItemFromCart.dart';
import 'cartItem.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, this.showQuantityBtn = true,this.showContainerBorder=true,
  this.cartItemSpacer=Sizes.spaceBetweenSections});

  final bool showQuantityBtn,showContainerBorder;
  final double cartItemSpacer;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      separatorBuilder: (_, index) =>  SizedBox(
        height: cartItemSpacer,
      ),
      itemBuilder: (_, index) {
        return CircularContainer(
          padding:showQuantityBtn? const EdgeInsets.only(
              right: Sizes.md, top: Sizes.md, bottom: Sizes.md):EdgeInsets.zero,
          radius: Sizes.md,
          showBorder: showContainerBorder,
          child: Column(
            children: [
              //cart item with image
              const CartItem(),
              if(showQuantityBtn)
              const SizedBox(
                height: Sizes.sm,
              ),
              if(showQuantityBtn)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //quatity btn
                 
                  Row(
                    children: const[
                    //  if(showQuantityBtn)
                       SizedBox(
                        width: 75,
                      ),
                    //  if(showQuantityBtn)
                       AddRemoveItemFromCart(),
                    ],
                  ),
                  const ProductPriceTxt(currency: "Ks", price: "1,000,000"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
