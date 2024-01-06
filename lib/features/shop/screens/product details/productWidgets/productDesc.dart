import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription(
      {super.key, required this.productDescTxt, required this.title});
  final String productDescTxt, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(title: title, btnTitle: ""),
        const SizedBox(
          height: Sizes.spaceBetween,
        ),
        ReadMoreText(
          productDescTxt,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: " Less",
          moreStyle: TextStyle(
              color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w800),
          lessStyle: TextStyle(
              color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
