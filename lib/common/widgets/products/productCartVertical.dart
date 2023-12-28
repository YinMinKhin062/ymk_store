import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/styles/shadowStyles.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/common/widgets/homeWidget/circularIcon.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/common/widgets/products/brandNameWithVerify.dart';
import 'package:ymk_store/common/widgets/text/productPriceTxt.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../utils/theme/custom_themes/sizes.dart';
import '../text/productTitleText.dart';

class ProductCartVertical extends StatelessWidget {
  const ProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black.withOpacity(.04)),
          color: Colors.black.withOpacity(.04),
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          boxShadow: [ShadowStyle.verticalProductShadow],
        ),
        child: Column(
          children: [
            //thumbnail, wishlist, discount tag
            CircularContainer(
              height: 155,
              width: 155,
              // bgColor: Colors.red,
              padding: const EdgeInsets.all(Sizes.sm),
            
              child: Stack(
                children: [
                  //thumbnail product image
                  const CurvedImage(
                     
                      imgBorderRadius: Sizes.sm,
                      isNetworkImg: true,
                      imgPath: assetImage.productOven),

                  //discount tag
                  Positioned(
                    top: 12,
                    left: 10,
                    child: CircularContainer(
                      width: 40,
                      height: 25,
                      radius: Sizes.sm,
                      bgColor: Colors.amber,
                      // bgColor: Colors.deepPurple.withOpacity(.2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.sm, vertical: Sizes.xs),
                      child: Text(
                        TxtContents.discountPercentTxt,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),

                  // wishlist
                   Positioned(
                      right: .8,
                      top: .8,
                      child: CircularIcon(
                        icon: Iconsax.heart,
                        size: Sizes.lg,
                        onPressed: () {
                          
                        },
                      )

                      ),
                ],
              ),
            ),

            //Product title
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleTxt(
                    productTitle: TxtContents.productOvenTxt,
                  ),
                  const SizedBox(
                    height: Sizes.spaceBetween / 2,
                  ),

                  //brand name and verifed icon

                 const BrandNameWithVerify(brandName: TxtContents.brandSamsung,),
                  // Row(
                  //   children: [
                  //     Text(
                  //       TxtContents.brandSamsung,
                  //       maxLines: 1,
                  //       overflow: TextOverflow.ellipsis,
                  //       style: Theme.of(context).textTheme.labelMedium,
                  //     ),
                  //     const SizedBox(
                  //       width: Sizes.spaceBetween / 2,
                  //     ),
                  //     const Icon(
                  //       Iconsax.verify5,
                  //       color: Colors.blue,
                  //       size: Sizes.md,
                  //     )
                  //   ],
                  // ),

                  // Spacer(),
                  const SizedBox(
                    height: Sizes.spaceBetween / 2,
                  ),

                  //product price and add cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      const ProductPriceTxt(currency: "Ks", price: '260000'),

                      //add to cart
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Sizes.cardRadiusMd),
                                bottomRight:
                                    Radius.circular(Sizes.productImageRadius))),
                        child: const SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Icon(
                            Iconsax.add,
                            color: Colors.white,
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
