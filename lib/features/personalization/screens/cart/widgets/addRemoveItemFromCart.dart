import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/controlllers/cartController.dart';

import '../../../../../common/widgets/homeWidget/circularIcon.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class AddRemoveItemFromCart extends StatelessWidget {
  const AddRemoveItemFromCart({super.key,required this.quantity,this.add,this.remove});

  final int quantity;
  final VoidCallback? add,remove;

  @override
  Widget build(BuildContext context) {
   
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
         CircularIcon(
          icon: Iconsax.minus,
          size: Sizes.md,
          width: 35,
          height: 35,
          iconColor: Colors.black,
          borderColor: Colors.black,
          onPressed: remove,
        ),
        const SizedBox(
          width: Sizes.spaceBetween,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: Sizes.spaceBetween,
        ),
         CircularIcon(
          icon: Iconsax.add,
          size: Sizes.md,
          width: 35,
          height: 35,
          iconColor: Colors.white,
          borderColor: Colors.black,
          color: Colors.black,
          onPressed:add,
        ),
      ],
    );
  }
}
