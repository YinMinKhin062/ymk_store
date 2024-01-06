import 'package:flutter/material.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';

import 'myRatingBarIndicator.dart';
import 'ratingProgressIndicator.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
     
      children: [
        //show rating text with large
        Expanded(
            flex: 3,
            child: Column(
              
              children: [
                //rating text with large
                Text(
                  "4.8",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w500),

                ),
                //rating star
                const MyRatingBarIndicator(ratingValue: 4.6),

                // const SizedBox(height: Sizes.sm/2,),

                //no of rating
                Text("199",style: Theme.of(context).textTheme.labelMedium,),
              ],
            )),
        const SizedBox(width: Sizes.spaceBetween,),
        //rate with linear progress indicator
        Expanded(
          flex: 7,
          child: Column(
            children: const [
              RatingProgressIndicator(
                starNo: '5',
                ratePercentage: .9,
              ),
              RatingProgressIndicator(
                starNo: '4',
                ratePercentage: .7,
              ),
              RatingProgressIndicator(
                starNo: '3',
                ratePercentage: .4,
              ),
              RatingProgressIndicator(
                starNo: '2',
                ratePercentage: .2,
              ),
              RatingProgressIndicator(
                starNo: '1',
                ratePercentage: .1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
