import 'package:flutter/material.dart';

import '../../../utils/constants/enum.dart';

class ProductTitleTxt extends StatelessWidget {
  final String productTitle;
  final TextSizes txtSize;
  final Color? color;
  const ProductTitleTxt(
      {super.key,
      required this.productTitle,
      this.txtSize = TextSizes.medium,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      productTitle,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: txtSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : txtSize == TextSizes.medium
              ? Theme.of(context).textTheme.labelLarge!.apply(color: color)
              : txtSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
      textAlign: TextAlign.left,
    );
  }
}