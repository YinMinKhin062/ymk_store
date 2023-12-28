import 'package:flutter/material.dart';

import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';
import 'brandCard.dart';
import 'brandTopProductImage.dart';

class BrandShowcase extends StatelessWidget {
  final List<String> images;

  const BrandShowcase({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      radius: 10,
      height: 190,
      showBorder: true,
      margin: const EdgeInsets.only(bottom: Sizes.spaceBetween),
      padding: const EdgeInsets.all(Sizes.md),
      child: Column(
        children: [
          //brand with counts
          const Expanded(
            child: BrandCard(
              showBorder: false,
            ),
          ),

          //top three products
          Row(
            children: images
                .map((image) => Expanded(child: brandTopProductImage(image: image)))
                .toList(),
          )
        ],
      ),
    );
  }
}
