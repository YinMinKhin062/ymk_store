import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/common/widgets/products/productCartVertical.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';

import 'brandShowCase.dart';

class TabCategory extends StatelessWidget {
  const TabCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              children: [
                //brandshowcase
                const BrandShowcase(
                  images: [
                    assetImage.brandTopMobileProduct1,
                    assetImage.brandTopMobileProduct2,
                    assetImage.brandTopMobileProduct3,
                  ],
                ),

                HeaderSection(
                  title: TxtContents.randomProductTitle,
                  btnTitle: TxtContents.viewAllBtnTxt,
                  showActionBtn: true,
                  btnTxtColor: Colors.grey,
                  onPressed: () {},
                ),

                const SizedBox(
                  height: Sizes.spaceBetween,
                ),

                GridLayout(
                  itemCount: 4,
                  mainAxisExtent: 263,
                  itemBuilder: (p0, p1) => const ProductCartVertical(),
                )
              ],
            ),
          ),
        ]);
  }
}
