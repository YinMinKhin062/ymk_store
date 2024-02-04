import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';

import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';

class brandTopProductImage extends StatelessWidget {
  final String image;
  const brandTopProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      height: 100,
      margin: const EdgeInsets.only(right: Sizes.sm),
      padding: const EdgeInsets.all(Sizes.md),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.contain,
        progressIndicatorBuilder: (context, url, progress) =>
            const MyShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      // child: Image(
      //     image: NetworkImage(image), fit: BoxFit.contain),
    );
  }
}
