import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/homeWidget/circularIcon.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../../../utils/constants/txtContents.dart';

class QuantityWithAddtoCart extends StatelessWidget {
  const QuantityWithAddtoCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                color: Colors.grey,
                iconColor: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(
                width: Sizes.spaceBetween,
              ),
              const Text("2"),
              const SizedBox(
                width: Sizes.spaceBetween,
              ),
              CircularIcon(
                icon: Iconsax.add,
                color: Colors.black,
                iconColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(
                  Sizes.md,
                ),
                backgroundColor: Colors.black,
                side: const BorderSide(color: Colors.black)),
            child: const Text(TxtContents.addToCartTxt),
          ),
        ],
      ) ;
  }
}