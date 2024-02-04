import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';

import '../theme/custom_themes/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      mainAxisExtent: 282,
      itemBuilder: (p0, p1) => SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            //Image
            MyShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: Sizes.spaceBetween,
            ),

            //Text
            MyShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: Sizes.spaceBetween / 2,
            ),
            MyShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
