import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/screens/productReview/productReview.dart';

import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class RateAndShare extends StatelessWidget {
  const RateAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Get.to(const productReview());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Rating
          Row(
            children: [
              const Icon(
                Iconsax.star5,
                color: Colors.amber,
              ),
              const SizedBox(
                width: Sizes.spaceBetween/2 ,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TxtContents.reviewTitle,style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600),),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: TxtContents.rateTxt,
                        style: Theme.of(context).textTheme.labelLarge),
                    TextSpan(
                        text: TxtContents.noOfReview,
                        style: Theme.of(context).textTheme.labelMedium)
                  ])),
                  const SizedBox(
                    width: Sizes.spaceBetween / 2,
                  ),
                ],
              ),

              // Text(
              //   "See Reviews",
              //   style: Theme.of(context)
              //       .textTheme
              //       .labelSmall!
              //       .copyWith(color: Colors.deepPurple),
              // ),
            ],
          ),

          //Sharing
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.share,
          //       size: Sizes.iconMd,
          //     ))

          // Text(
          //   "See Reviews",
          //   style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.deepPurple),

          // ),
          // Icon(
          //   Iconsax.arrow_right_3,
          //   size: 18,
          // ),

          IconButton(
              onPressed: () {
                Get.to(()=>const productReview());
              },
              icon: const Icon(
                Iconsax.arrow_right_3,
                size: 18,
              ))
        ],
      ),
    );
  }
}
