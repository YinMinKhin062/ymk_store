import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/controlllers/productController.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';

import '../../../../../common/widgets/customShapes/containers/circularContainer.dart';
import '../../../../../common/widgets/products/brandNameWithVerify.dart';
import '../../../../../common/widgets/text/productTitleText.dart';
import '../../../../../utils/constants/enum.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final discountPercent = controller.calculateSalePercent(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //discount tag
            if(double.parse(discountPercent!)>0)
            CircularContainer(
              width: 40,
              height: 40,
              radius: 100,
              bgColor: Colors.amber.withOpacity(.9),
              padding: const EdgeInsets.all(Sizes.sm),
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text:"-$discountPercent %",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  // TextSpan(
                  //     text: TxtContents.discountOffTxt,
                  //     style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  //         color: Colors.black,
                  //         fontSize: 9.5,
                  //         fontWeight: FontWeight.bold)),
                ])),
              ),
            ),

            const SizedBox(
              width: Sizes.sm + 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TxtContents.priceTxt,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                //price
                Row(
                  children: [
                    Text(
                      "\$${product.price}",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          decoration: TextDecoration.lineThrough), //titlesmall
                    ),
                    const SizedBox(width: Sizes.sm),
                    Text(
                      "\$${product.salePrice}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.red), //titlesmall
                    ),
                  ],
                )
              ],
            ),

            // const ProductPriceTxt(
            //   currency: "Ks",
            //   price: "195,000",
            //   isLarge: false,
            //   color: Colors.red,
            // ),
          ],
        ),
        const SizedBox(
          height: Sizes.spaceBetween / 1.5,
        ),
        Divider(
          color: Colors.black.withOpacity(.1),
        ),
        const SizedBox(
          height: Sizes.spaceBetween / 1.5,
        ),

        //product title
        ProductTitleTxt(
          productTitle: product.title,
          txtSize: TextSizes.large,
        ),
        const SizedBox(
          height: Sizes.spaceBetween / 1.5,
        ),

        //product stock status
        Row(
          children: [
            const ProductTitleTxt(
              productTitle: TxtContents.statusTitle,
              txtSize: TextSizes.small,
            ),
            const SizedBox(
              width: Sizes.spaceBetween,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),

        const SizedBox(
          height: Sizes.spaceBetween / 2,
        ),

        BrandNameWithVerify(
          brandName: product.brand!.name,
          txtSizes: TextSizes.large,
        )
      ],
    );
  }
}
