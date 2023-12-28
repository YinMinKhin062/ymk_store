import 'package:flutter/material.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class HorizontalImageText extends StatelessWidget {

  final String imgCategoryTxt,image;
  final Color categoryTxtColor;
  final bool isNetworkImg;
  final void Function()? onTap;
  
  const HorizontalImageText({super.key,required this.isNetworkImg,required this.image,
  required this.imgCategoryTxt,
  required this.categoryTxtColor, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Sizes.spaceBetweenSections),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child:  CircleAvatar(
                  backgroundImage: isNetworkImg? NetworkImage(image):AssetImage(image) as ImageProvider),
            ),
            const SizedBox(
              height: Sizes.spaceBetweenSections / 2,
            ),
            SizedBox(
              width: 45,
              child: Text(
                imgCategoryTxt,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: categoryTxtColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
