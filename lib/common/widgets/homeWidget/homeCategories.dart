import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/screens/subcategories/subcategories.dart';

import '../../../utils/constants/txtContents.dart';
import '../../../utils/constants/assetImage.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../text/headerSection.dart';
import '../text/horizontalImageText.dart';

class HomeCategories extends StatelessWidget {
  final String headingTxt;
  const HomeCategories({super.key, required this.headingTxt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.defaultSpace,
      ),
      child: Column(
        children: [
          //heading
          HeaderSection(
            title: headingTxt,
            btnTitle: TxtContents.viewAllBtnTxt,
            showActionBtn: false,
            txtColor: Colors.white,
          ),
          const SizedBox(
            height: Sizes.inputFieldSpaces,
          ),

          //categories
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap:
                  true, //so that the ListView only occupies the space it needs (it will still scroll when there more items).
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HorizontalImageText(
                  isNetworkImg: true,
                  image: assetImage.category1,
                  imgCategoryTxt: TxtContents.categoryName,
                  categoryTxtColor: Colors.white,
                  onTap: () {
                    Get.to(()=>const SubCategories());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
