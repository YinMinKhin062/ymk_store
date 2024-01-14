import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../common/widgets/products/productCardHorizontal.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Audio"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              CurvedImage(
                isNetworkImg: true,
                imgPath: assetImage.productEarbuds,
                border: Border.all(color: Colors.grey.withOpacity(.1)),
              ),
              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),
              Column(
                children: [
                  HeaderSection(
                    title: "Earbuds",
                    btnTitle: TxtContents.viewAllBtnTxt,
                    showActionBtn: true,
                    onPressed: () {},
                    btnTxtColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: Sizes.spaceBetween / 2,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ProductCardHorizontal(),
                      separatorBuilder: (_, index) => const SizedBox(
                        width: Sizes.spaceBetween,
                      ),
                    ),
                  )

                  // const ProductCardHorizontal(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
