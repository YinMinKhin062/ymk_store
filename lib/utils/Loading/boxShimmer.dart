import 'package:flutter/material.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';

import '../theme/custom_themes/sizes.dart';

class BoxShimmer extends StatelessWidget {
  const BoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: MyShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: Sizes.spaceBetween,
            ),
            Expanded(child: MyShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: Sizes.spaceBetween,
            ),
            Expanded(child: MyShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
