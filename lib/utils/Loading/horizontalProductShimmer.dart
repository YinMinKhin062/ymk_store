import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';

import '../theme/custom_themes/sizes.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key, this.itemCount=4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: Sizes.spaceBetweenSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MyShimmerEffect(width: 120, height: 110),
            const SizedBox(width: Sizes.spaceBetween,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:const [
                MyShimmerEffect(width: 160, height: 15),
                SizedBox(height: Sizes.spaceBetween/2,),
                MyShimmerEffect(width: 110, height: 15)
              ],
            )
          ],
        ),
         separatorBuilder: (_, index) => const SizedBox(width: Sizes.spaceBetween,),
          itemCount: itemCount),
    );
  }
}