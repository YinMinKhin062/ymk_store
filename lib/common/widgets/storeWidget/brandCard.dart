import 'package:flutter/material.dart';

import '../../../features/shop/models/brandModel.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';
import '../customShapes/containers/circularImage.dart';
import '../products/brandNameWithVerify.dart';

class BrandCard extends StatelessWidget {
  final bool showBorder;
  final void Function()? onTap;
  // final String brandImg, brandName, brandProductCounts;
  final BrandModel brand;

  const BrandCard(
      {super.key, this.showBorder = true, this.onTap, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircularContainer(
        padding: const EdgeInsets.all(Sizes.sm),
        bgColor: Colors.transparent,
        radius: 10,
        showBorder: showBorder,

        //brand img
        child: Row(children: [
          Flexible(
            child: CircularImage(
              width: 50,
              height: 50,
              padding: Sizes.sm,
              image: brand.image,
              isNetworkImage: true,
            ),
          ), // to resize the image , so use flexible
          const SizedBox(
            width: Sizes.spaceBetween / 2,
          ),

          //brand Title and counts
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrandNameWithVerify(
                  brandName: brand.name,
                  txtSizes: TextSizes.large,
                ),
                const SizedBox(
                  height: Sizes.sm / 2,
                ),
                Text(
                  '${brand.productCount} products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ) // to fill the available spaces ,so use expanded
        ]),
      ),
    );
  }
}
