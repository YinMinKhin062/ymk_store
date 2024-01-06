import 'package:flutter/material.dart';

import '../../../../../common/widgets/customShapes/containers/circularContainer.dart';
import '../../../../../common/widgets/products/brandNameWithVerify.dart';
import '../../../../../common/widgets/text/productTitleText.dart';
import '../../../../../utils/constants/enum.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //discount tag
            CircularContainer(
              width: 40,
              height: 40,
              radius: 100,
              bgColor: Colors.amber.withOpacity(.9),
              padding: const EdgeInsets.all(Sizes.sm),
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: TxtContents.discountPercentTxt,
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
              width: Sizes.sm+2,
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
                      "Ks 260,000",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          decoration: TextDecoration.lineThrough), //titlesmall
                    ),
                    const SizedBox(width: Sizes.sm),
                    Text(
                      "Ks 195,000",
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
        const ProductTitleTxt(
          productTitle: TxtContents.productSmartWatchTxt,
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
              TxtContents.statusValueTxt,
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),

        const SizedBox(
          height: Sizes.spaceBetween / 2,
        ),

        const BrandNameWithVerify(
          brandName: TxtContents.brandRemax,
          txtSizes: TextSizes.large,
        )
      ],
    );
  }
}
