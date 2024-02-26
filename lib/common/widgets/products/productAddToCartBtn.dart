import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/controlllers/cartController.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:ymk_store/features/shop/screens/product%20details/productDetails.dart';

import '../../../features/shop/controlllers/product/variableController.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class ProductAddToCartBtn extends StatelessWidget {
  const ProductAddToCartBtn({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = controller.convertToCartItem(product, 1);
          controller.addOneToCart(cartItem);
        } else {
          VariableController.instance.currentAttribute.clear();
          Get.to(() => ProductDetail(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            controller.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
              color:
                  productQuantityInCart > 0 ? Colors.deepPurple : Colors.black,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Sizes.cardRadiusMd),
                  bottomRight: Radius.circular(Sizes.productImageRadius))),
          child: SizedBox(
            height: 40,
            width: 40,
            child: Center(
                child: productQuantityInCart > 0
                    ? Text(
                        productQuantityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.white),
                      )
                    : const Icon(
                        Iconsax.add,
                        color: Colors.white,
                      )),
          ),
        );
      }),
    );
  }
}
