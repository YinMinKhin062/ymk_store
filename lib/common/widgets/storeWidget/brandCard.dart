import 'package:flutter/material.dart';

import '../../../utils/constants/enum.dart';
import '../../../utils/constants/txtContents.dart';
import '../../../utils/constants/assetImage.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';
import '../customShapes/containers/circularImage.dart';
import '../products/brandNameWithVerify.dart';

class BrandCard extends StatelessWidget {
final bool showBorder;
final void Function()? onTap;

  const BrandCard({super.key,this.showBorder=true,this.onTap});

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
          const Flexible(
            child: CircularImage(
              width: 50,
              height: 50,
              padding: Sizes.sm,
              image: assetImage.brandIOS,
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
                const BrandNameWithVerify(
                  brandName: TxtContents.brandIOS,
                  txtSizes: TextSizes.large,
                ),
                const SizedBox(height: Sizes.sm/2,),
                Text(
                  TxtContents.IOSProductCounts,
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
