import 'package:flutter/material.dart';

import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';

class brandTopProductImage extends StatelessWidget {

    final String image;
  const brandTopProductImage({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      height: 100,
      margin: const EdgeInsets.only(right: Sizes.sm),
      padding: const EdgeInsets.all(Sizes.md),
      child: Image(
          image: NetworkImage(image), fit: BoxFit.contain),
    );
  }
}
