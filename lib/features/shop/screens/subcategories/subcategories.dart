import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/homeWidget/curvedImage.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/shop/controlllers/categoryController.dart';
import 'package:ymk_store/features/shop/models/categoryModel.dart';
import 'package:ymk_store/features/shop/screens/allProducts/allProducts.dart';
import 'package:ymk_store/utils/Loading/horizontalProductShimmer.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';

import '../../../../common/widgets/products/productCardHorizontal.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(category.name),
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

              //sub-categories
              FutureBuilder(
                  future: controller.getSubCategoires(category.id),
                  builder: (context, snapshot) {
                    const loader = HorizontalProductShimmer();
                    final widget = CloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final SubCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: SubCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = SubCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                              categoryId: subCategory.id,
                            ),
                            builder: (context, snapshot) {
                              final res =
                                  CloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (res != null) return res;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  HeaderSection(
                                    title: subCategory.name,
                                    btnTitle: TxtContents.viewAllBtnTxt,
                                    showActionBtn: true,
                                    onPressed: () {
                                      Get.to(() => AllProducts(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          ));
                                    },
                                    btnTxtColor: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: Sizes.spaceBetween / 2,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                    shrinkWrap: true,
                                    physics:const BouncingScrollPhysics(),
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) =>
                                          ProductCardHorizontal(
                                        product: products[index],
                                      ),
                                      separatorBuilder: (_, index) =>
                                          const SizedBox(
                                        width: Sizes.spaceBetween,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Sizes.spaceBetween,
                                  )
                                ],
                              );
                            });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
