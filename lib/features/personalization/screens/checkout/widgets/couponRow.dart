import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/personalization/screens/checkout/coupon.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class CouponRow extends StatelessWidget {
  const CouponRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=>const Coupon()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Sizes.sm),
            child: Row(
              children: [
                const Icon(Icons.confirmation_num,
                    color: Colors.deepPurple, size: Sizes.spaceBetweenSections),
                const SizedBox(
                  width: Sizes.md,
                ),
                Text(
                  "Have a Coupon Code ?",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                )
              ],
            ),
          ),
          const Icon(
            Iconsax.arrow_right_3,
            size: Sizes.spaceBetween,
          )
        ],
      ),
    );
  }
}
