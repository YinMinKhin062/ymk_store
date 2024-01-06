import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/screens/productReview/reviewWidgets/helpful.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';
import 'myRatingBarIndicator.dart';
import 'reviewDescription.dart';

class UserReviews extends StatelessWidget {
  const UserReviews({super.key,required this.userName, this.imgName});

  final String userName;
  final String ?imgName;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //user's name & photo with more icon
            Row(
              children: [
                imgName!=null? CircleAvatar(
                  backgroundImage:NetworkImage(imgName!),
                )
                :CircleAvatar(
                  child: Text(userName.substring(0,1,),style: Theme.of(context).textTheme.headlineSmall,),
                )
                ,
                const SizedBox(
                  width: Sizes.spaceBetween,
                ),
                Text(
                  userName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: Sizes.spaceBetween,
        ),

        //stars & date
        Row(
          children: [
            const MyRatingBarIndicator(
              ratingValue: 3,
            ),
            const SizedBox(width: Sizes.spaceBetween),
            Text(
              "01 Jan,2024",
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
        const SizedBox(
          height: Sizes.spaceBetween,
        ),
        const ReviewDescription(
          userReviewTxt:
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
        ),
        const SizedBox(
          height: Sizes.spaceBetween,
        ),
        Helpful(
          firstIcon: Iconsax.like_14,
          changedIcon: Iconsax.like_15,
          text: "Helpful",
          isClicked: false,
        ),
        const SizedBox(height: Sizes.spaceBetweenSections+3,)
      ],
    );
  }
}
