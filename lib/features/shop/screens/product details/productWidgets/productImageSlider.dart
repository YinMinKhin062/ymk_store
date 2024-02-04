import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/controlllers/product/imagesController.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';

import '../../../../../common/widgets/customShapes/curvedEdges/curvedEdgesWidget.dart';
import '../../../../../common/widgets/homeWidget/appbar.dart';
import '../../../../../common/widgets/homeWidget/circularIcon.dart';
import '../../../../../common/widgets/homeWidget/curvedImage.dart';
import '../../../../../common/widgets/products/favouriteIcon.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getProductImages(product);

    return CurvedEdgesWidget(
      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.deepPurple.withOpacity(.1),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                //image
                SizedBox(
                    height: 400, //400
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Sizes.productImageRadius * 3,
                          horizontal: Sizes.productImageRadius * 3.5),
                      child: Center(child: Obx(() {
                        final image = controller.currentProductImage.value;
                        return GestureDetector(
                          onTap: () => controller.showEnlargedImage(image),
                          child: CurvedImage(
                            isNetworkImg: true,
                            imgPath: image,
                            fit: BoxFit.contain,
                          ),
                          // child: CachedNetworkImage(
                          //   imageUrl: image,
                          //   progressIndicatorBuilder: (_, __, progress) =>
                          //       CircularProgressIndicator(
                          //     value: progress.progress,
                          //     color: Colors.deepPurple,
                          //   ),
                          // ),
                        );
                      })),
                    )),

                //slider

                Positioned(
                  right: 0,
                  bottom: 30,
                  left: Sizes.defaultSpace,
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: images.length,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: Sizes.spaceBetween,
                      ),
                      itemBuilder: (context, index) => Obx(() {
                        final currentImage =
                            controller.currentProductImage.value ==
                                images[index];
                        return CurvedImage(
                          imgBorderRadius: Sizes.spaceBetweenSections,
                          cardRadius: Sizes.spaceBetween,
                          isNetworkImg: true,
                          width: 80,
                          bgColor: const Color.fromRGBO(255, 255, 255, 1),
                          padding: const EdgeInsets.all(Sizes.sm / 2),
                          border: Border.all(
                              color: currentImage
                                  ? Colors.deepPurple
                                  : Colors.grey.withOpacity(.2)),
                          imgPath: images[index],
                          onTap: () => controller.currentProductImage.value =
                              images[index],
                        );
                      }),
                    ),
                  ),
                ),

                // appbar
                CustomAppBar(
                  showBackArrow: true,
                  actions: [
                    //wishlist icon
                     FavouriteIcon(productId: product.id,),
                    
                    //shared btn
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          size: Sizes.iconMd,
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
