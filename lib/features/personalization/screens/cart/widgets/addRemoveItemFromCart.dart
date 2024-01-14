import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/homeWidget/circularIcon.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class AddRemoveItemFromCart extends StatelessWidget {
  const AddRemoveItemFromCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularIcon(
          icon: Iconsax.minus,
          size: Sizes.md,
          width: 35,
          height: 35,
          iconColor: Colors.black,
          borderColor: Colors.black,
        ),
        const SizedBox(
          width: Sizes.spaceBetween,
        ),
        Text(
          "1",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: Sizes.spaceBetween,
        ),
        const CircularIcon(
          icon: Iconsax.add,
          size: Sizes.md,
          width: 35,
          height: 35,
          iconColor: Colors.white,
          borderColor: Colors.black,
          color: Colors.black,
        ),
      ],
    );
  }
}
