import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';

import '../theme/custom_themes/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(.5),
      highlightColor: Colors.black.withOpacity(.3),
      child: SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          separatorBuilder: (_, __) => const SizedBox(
            width: Sizes.defaultSpace,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: const [
                MyShimmerEffect(
                  width: 45,
                  height: 45,
                  radius: 45,
                ),
                SizedBox(
                  height: Sizes.spaceBetweenSections / 2,
                ),
                MyShimmerEffect(width: 55, height: 8)
              ],
            );
          },
        ),
      ),
    );
  }
}
