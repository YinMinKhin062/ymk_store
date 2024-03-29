import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';
import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/productDesc.dart';
import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/productImageSlider.dart';
import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/rateAndShare.dart';
import 'package:ymk_store/utils/constants/enum.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../../personalization/screens/checkout/checkout.dart';
import 'productWidgets/bottomAddToCart.dart';
import 'productWidgets/productAttribute.dart';
import 'productWidgets/productDetailsBtmToCart.dart';
import 'productWidgets/productMetadata.dart';
import 'productWidgets/quantityWithAddtoCart.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProductDetailsBtmAddToCart(
        product: product,
      ),
      // backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image slider
            ProductImageSlider(
              product: product,
            ),

            //product details
            const SizedBox(
              height: Sizes.spaceBetween,
            ),
            CircularContainer(
              height: 280,
              width: MediaQuery.of(context).size.width * .85,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
              showBorder: true,
              radius: Sizes.cardRadiusMd,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.defaultSpace),
                child: Column(
                  children: [
                    const RateAndShare(),
                    // SizedBox(
                    //   height: Sizes.sm,
                    // ),
                    Divider(
                      color: Colors.black.withOpacity(.1),
                    ),
                    const SizedBox(
                      height: Sizes.sm,
                    ),

                    ProductMetadata(
                      product: product,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(
                  top: Sizes.spaceBetween,
                  bottom: Sizes.spaceBetweenSections,
                  left: Sizes.spaceBetweenSections,
                  right: Sizes.spaceBetweenSections,
                ),
                child: Column(
                  children: [
                    if (product.productType == ProductType.variable.toString())
                      ProductAttribute(
                        product: product,
                      ),
                    if (product.productType == ProductType.variable.toString())
                      const SizedBox(
                        height: Sizes.spaceBetween,
                      ),

                    //checkout btn
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed:()=>Get.to(()=>const Checkout()) ,
                          child: const Text(TxtContents.checkOutTxt)),
                    ),

                    const SizedBox(
                      height: Sizes.spaceBetween,
                    ),
                    //checkout
                    ProductDescription(
                      title: "Specification",
                      productDescTxt: product.description ?? '',
                      // productDescTxt:
                      // "Color - Graphite Black, Ivory White \nDimensions - 42.4x36x8.8mm\nWeight(without strap) - 24.4g\nBody Material - Aluminum alloy\nButtons - 1\nWater-resistance - Grade 5 ATM\nDisplay Material - AMOLED\nSize - 1.75 inches\nResolution - 390 x 450\nPPI - 341\nTouchscreen - Tempered glass Anti-fingerprint coating",
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
