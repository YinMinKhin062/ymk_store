import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class MyRatingBarIndicator extends StatelessWidget {
  const MyRatingBarIndicator({super.key,required this.ratingValue});
  final double ratingValue;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: Colors.grey.withOpacity(.2),
      itemCount: 5,
      itemSize: 17,
      rating: ratingValue,
      itemBuilder: (context, index) => const Icon(
        Iconsax.star1,
        color: Colors.amber,
      ),
    );
  }
}
