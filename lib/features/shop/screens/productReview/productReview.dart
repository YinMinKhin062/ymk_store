import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/shop/screens/productReview/reviewWidgets/overallProductRating.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import 'reviewWidgets/userReviews.dart';

class productReview extends StatelessWidget {
  const productReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(TxtContents.reviewAppBarTitle),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Text(TxtContents.reviewVerifyParam),

            // overall product ratings

            OverallProductRating(),
            //  MyRatingBarIndicator(ratingValue: 4.6),
            SizedBox(height: Sizes.spaceBetweenSections,),
            UserReviews(imgName: assetImage.user, userName: "Hesley",),
            UserReviews( userName: "Esther",),
            UserReviews(imgName: assetImage.user1, userName: 'Han So Hee',),
          ],
        ),
      )),
    );
  }
}
