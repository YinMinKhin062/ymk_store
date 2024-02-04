import 'package:flutter/material.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';

import '../theme/custom_themes/sizes.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const MyShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            const SizedBox(width: Sizes.spaceBetween,),
            Column(
              children: const [
                MyShimmerEffect(width: 100, height: 15),
                SizedBox(
                  height: Sizes.spaceBetween / 2,
                ),
                MyShimmerEffect(width: 100, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
