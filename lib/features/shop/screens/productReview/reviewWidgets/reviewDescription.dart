import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReviewDescription extends StatelessWidget {
  const ReviewDescription({super.key, required this.userReviewTxt});

  final String userReviewTxt;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      userReviewTxt,
      style: Theme.of(context).textTheme.bodyMedium,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: "Show more",
      trimExpandedText: "Less",
      // moreStyle: TextStyle(color: Colors.black.withOpacity(.5)),
      moreStyle: TextStyle(
          color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w800),
      lessStyle: TextStyle(
          color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w800),
    );
  }
}
