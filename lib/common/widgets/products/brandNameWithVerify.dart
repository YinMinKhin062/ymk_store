import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/utils/constants/enum.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class BrandNameWithVerify extends StatelessWidget {
  final String brandName;
  final Color iconColor;
  final TextAlign txtAlign;
  final TextSizes txtSizes;

  const BrandNameWithVerify(
      {super.key,
      required this.brandName,
      this.iconColor = Colors.blue,
      this.txtAlign = TextAlign.center,
      this.txtSizes=TextSizes.medium});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            brandName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: txtSizes==TextSizes.large?
             Theme.of(context).textTheme.bodyMedium:
             Theme.of(context).textTheme.labelMedium,
          ),
        ),
        const SizedBox(
          width: Sizes.spaceBetween / 2,
        ),
        const Icon(
          Iconsax.verify5,
          color: Colors.blue,
          size: Sizes.md,
        )
      ],
    );
  }
}
