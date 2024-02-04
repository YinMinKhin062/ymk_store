import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/styles/shadowStyles.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/common/widgets/homeWidget/circularIcon.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/common/widgets/products/brandNameWithVerify.dart';
import 'package:ymk_store/common/widgets/text/productPriceTxt.dart';
import 'package:ymk_store/features/shop/controlllers/productController.dart';

import '../../../features/shop/models/productModel.dart';
import '../../../features/shop/screens/product details/productDetails.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../text/productTitleText.dart';
import 'favouriteIcon.dart';

class ProductCartVertical extends StatelessWidget {
  const ProductCartVertical({super.key, required this.product});

  final ProductModel product;
  // bool showWishlist=false;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    final discountpercent =
        controller.calculateSalePercent(product.price, product.salePrice);

    return GestureDetector(
        onTap: () => Get.to(ProductDetail(
              product: product,
            )),
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
                width: 130,
                radius: 8,
                bgColor: Colors.white.withOpacity(.8),
                padding: const EdgeInsets.all(Sizes.sm),

                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //thumbnail image
                    CurvedImage(
                        height: 145,
                        fit: BoxFit.contain,
                        imgBorderRadius: Sizes.sm,
                        isNetworkImg: true,
                        imgPath: product.thumbnail),

                    // discount tag
                    if (double.parse(discountpercent!) >
                        0) //show only have discount
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
                            "-$discountpercent %",
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
                        // child: CircularIcon(
                        //   showBorder: false,
                        //   icon: Iconsax.heart,
                        //   size: Sizes.lg,
                        //   onPressed: () {},
                        // )
                        child: FavouriteIcon(productId:product.id ,),
                        ),
                  ],
                ),
              ),

              const SizedBox(
                height: Sizes.spaceBetween / 2 + 3,
              ),

              //Product title
              Padding(
                padding: const EdgeInsets.only(left: Sizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleTxt(
                      productTitle: product.title,
                    ),
                    const SizedBox(
                      height: Sizes.spaceBetween / 2,
                    ),

                    //brand name and verifed icon

                    BrandNameWithVerify(
                      brandName: product.brand!=null ? product.brand!.name:'',
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
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.salePrice > 0)
                                // if (product.productType ==
                                //         ProductType.single.toString() &&
                                //     product.salePrice > 0)
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
