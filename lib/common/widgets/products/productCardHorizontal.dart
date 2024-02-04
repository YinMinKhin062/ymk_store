import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/common/widgets/products/brandNameWithVerify.dart';
import 'package:ymk_store/common/widgets/text/productPriceTxt.dart';
import 'package:ymk_store/common/widgets/text/productTitleText.dart';
import 'package:ymk_store/features/shop/controlllers/productController.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';

import '../../../utils/constants/txtContents.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../homeWidget/circularIcon.dart';
import 'favouriteIcon.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key,required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final discountpercent=controller.calculateSalePercent(product.price,product.salePrice);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black.withOpacity(.04)),

        color: Colors.black.withOpacity(.04),

        borderRadius: BorderRadius.circular(Sizes.productImageRadius),
        // boxShadow: [ShadowStyle.verticalProductShadow],
      ),
      child: Row(
        children: [
          CircularContainer(
            height: 110,
            padding: const EdgeInsets.all(Sizes.sm),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                //thumbnail img
                 CurvedImage(
                  width: 120,
                  height: 110,
                  isNetworkImg: true,
                  imgPath: product.thumbnail,
                  fit: BoxFit.contain,
                ),
                //sale tag
                // discount tag
                if(double.parse(discountpercent!)>0)
                Positioned(
                  top: 3,
                  // left: 3,
                  child: CircularContainer(
                    width: 40,
                    height: 20,
                    radius: Sizes.sm,
                    bgColor: Colors.amber.withOpacity(.7),
                    // bgColor: Colors.deepPurple.withOpacity(.2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.sm, vertical: Sizes.xs),
                    child: Text(
                      "-${discountpercent} %",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.black, fontSize: 8),
                    ),
                  ),
                ),
                //wishlist
                 Positioned(
                    right: 0, //.8
                    top: -7,
                    child: FavouriteIcon(productId: product.id,)
                    // child: CircularIcon(
                    //   showBorder: false,
                    //   color: Colors.white,
                    //   icon: Iconsax.heart5,
                    //   iconColor: Colors.red,
                    //   size: Sizes.lg,
                    //   onPressed: () {},
                    // )
                    ),
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: Sizes.sm, left: Sizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      ProductTitleTxt(
                        productTitle: product.title,
                        maxLines: 2,
                      ),
                     const SizedBox(
                        height: Sizes.spaceBetween / 2,
                      ),
                      BrandNameWithVerify(brandName: product.brand!=null? product.brand!.name:'')
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: Sizes.spaceBetween/2+4,
                // ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: Sizes.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                       Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.salePrice > 0)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: Sizes.sm),
                                  child: Text(
                                    "\$${product.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(left: Sizes.sm),
                                child: ProductPriceTxt(
                                    currency: "\$",
                                    price: product.salePrice.toString()),
                              ),
                            ],
                          ),
                        ),
                      //add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(Sizes.productImageRadius)),
                        ),
                        child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Iconsax.add,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
