import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';


class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key, this.radius = 10, this.brandItem = 4});

  final double radius;
  final int brandItem;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(.4),
      highlightColor: Colors.black.withOpacity(.3),
      child: GridLayout(
        itemCount: brandItem,
        itemBuilder: (_, index) {
          // CircularContainer(
          //   radius: radius,
          //   child: Row(
          //     children: [
          //       const MyShimmerEffect(width: 50, height: 50),
          //       const SizedBox(
          //         width: Sizes.spaceBetween / 2,
          //       ),
          //       Column(
          //         children: const [
          //           MyShimmerEffect(width: 120, height: 120),
          //           SizedBox(
          //             height: Sizes.sm / 2,
          //           ),
          //           MyShimmerEffect(width: 50, height: 50)
          //         ],
          //       )
          //     ],
          //   ),
          // );
          return const MyShimmerEffect(width: 300, height: 80);
        },
        mainAxisExtent: 60,
      ),
    );
  }
}
