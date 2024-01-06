import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/styles/shadowStyles.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/common/widgets/homeWidget/circularIcon.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/common/widgets/products/brandNameWithVerify.dart';
import 'package:ymk_store/common/widgets/text/productPriceTxt.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../features/shop/screens/product details/productDetails.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../text/productTitleText.dart';

class ProductCartVertical extends StatefulWidget {
  const ProductCartVertical({super.key});

  @override
  State<ProductCartVertical> createState() => _ProductCartVerticalState();
}

class _ProductCartVerticalState extends State<ProductCartVertical> {
  // bool showWishlist=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.to(const ProductDetail()),
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
              const SizedBox(
                height: Sizes.spaceBetween / 2,
              ),
              //thumbnail, wishlist, discount tag

              CircularContainer(
                height: 155, //155
                width:130,
                radius: 8,
                bgColor: Colors.white.withOpacity(.8),
                padding: const EdgeInsets.all(Sizes.sm),

                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //thumbnail image
                        const CurvedImage(
                          height: 145,
                         
                            fit: BoxFit.contain,
                            imgBorderRadius: Sizes.sm,
                            isNetworkImg: true,
                            imgPath: assetImage.productSmartWatch),
                  

                    // discount tag
                    Positioned(
                      top: 3,
                     
                      // left: 3,
                      child: CircularContainer(
                        width: 40,
                        height: 20,
                        radius: Sizes.sm,
                        bgColor: Colors.amber.withOpacity(.9),
                        // bgColor: Colors.deepPurple.withOpacity(.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.sm, vertical: Sizes.xs),
                        child: Text(
                          TxtContents.discountPercentTxt,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.black,fontSize: 8),
                        ),
                      ),
                    ),

                    //wishlist
                     Positioned(
                        right:0,//.8
                        top: -7,
                        child: CircularIcon(
                          showBorder: false,
                          icon: Iconsax.heart,
                          size: Sizes.lg,
                          onPressed: () {

                          },
                        )

                        ),
                  ],
                ),
              ),

             const SizedBox(
                height: Sizes.spaceBetween/2+3,
              ),

              //Product title
              Padding(
                padding: const EdgeInsets.only(left: Sizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductTitleTxt(
                      productTitle: TxtContents.productSmartWatchTxt,
                    ),
                    const SizedBox(
                      height: Sizes.spaceBetween / 2,
                    ),

                    //brand name and verifed icon

                    const BrandNameWithVerify(
                      brandName: TxtContents.brandRemax,
                    ),
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
                                  bottomRight: Radius.circular(
                                      Sizes.productImageRadius))),
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
              ),
            ],
          ),
        ));
  }
}
