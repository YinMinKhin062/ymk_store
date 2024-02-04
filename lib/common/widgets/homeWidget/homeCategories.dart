import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/controlllers/categoryController.dart';
import 'package:ymk_store/features/shop/screens/subcategories/subcategories.dart';
import 'package:ymk_store/utils/Loading/categoryShimmer.dart';

import '../../../utils/constants/txtContents.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../text/headerSection.dart';
import '../text/horizontalImageText.dart';

class HomeCategories extends StatelessWidget {
  final String headingTxt;
  const HomeCategories({super.key, required this.headingTxt});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

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
          Obx(() {
            if (controller.isLoading.value) {
              return const CategoryShimmer();
            } 
            if (controller.featuredCategories.isEmpty) {
              return Center(
                  child: Text(
                "No Data Found!",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ));
            } else {
              
             return SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap:
                      true, //so that the ListView only occupies the space it needs (it will still scroll when there more items).
                  itemCount: controller.featuredCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = controller.featuredCategories[index];
                    return HorizontalImageText(
                      isNetworkImg: true,
                      image: category.image,
                      imgCategoryTxt: category.name,
                      categoryTxtColor: Colors.white,
                      onTap: () {
                        Get.to(() =>  SubCategories(category: category,));
                      },
                    );
                  },
                ),
              );
             
            }
          })
        ],
      ),
    );
  }
}
