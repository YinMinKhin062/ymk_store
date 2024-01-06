import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customShapes/curvedEdges/curvedEdgesWidget.dart';
import '../../../../../common/widgets/homeWidget/appbar.dart';
import '../../../../../common/widgets/homeWidget/circularIcon.dart';
import '../../../../../common/widgets/homeWidget/curvedImage.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../../../utils/constants/assetImage.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(.1),
            // color: Colors.white, border: Border.all(color: Colors.grey)
            ),
        child: Column(
          children: [
            Stack(
              children: [
                //image
                const SizedBox(
                    height: 400, //400
                    child: Padding(
                      padding: EdgeInsets.all(Sizes.productImageRadius * 2),
                      child: Center(
                          child: Image(
                              image:
                                  AssetImage(assetImage.productSmartWatch6))),
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
                      itemCount: 6,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: Sizes.spaceBetween,
                      ),
                      itemBuilder: (context, index) => CurvedImage(
                          isNetworkImg: true,
                          width: 80,
                          bgColor: Colors.white,
                          padding: const EdgeInsets.all(Sizes.sm),
                          border:
                              Border.all(color: Colors.grey.withOpacity(.2)),
                          imgPath: assetImage.productSmartWatch0),
                    ),
                  ),
                ),

                // appbar
                CustomAppBar(
                  showBackArrow: true,
                  actions: [
                    CircularIcon(
                      icon: Iconsax.heart5,
                      iconColor: Colors.red,
                      showBorder: false,
                      onPressed: () {},
                    ),
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
            const SizedBox(
              height: Sizes.spaceBetween,
            )
          ],
        ),
      ),
    );
  }
}
