import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/common/widgets/products/productCartVertical.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/shop/controlllers/categoryController.dart';
import 'package:ymk_store/features/shop/screens/allProducts/allProducts.dart';
import 'package:ymk_store/features/shop/screens/subcategories/subcategories.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';

import '../../../features/shop/models/categoryModel.dart';
import '../../../utils/Loading/verticalProductShimmer.dart';
import 'widgets/categoryBrands.dart';

class TabCategory extends StatelessWidget {
  const TabCategory({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              children: [
                //brandshowcase
                CategoryBrand(
                  category: category,
                ),

                FutureBuilder(
                    future: categoryController.getCategoryProducts(
                        categoryId: category.id),
                    builder: (context, snapshot) {
                      final res = CloudHelperFunctions.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: const VerticalProductShimmer());
                      if (res != null) return res;

                      

                      final products = snapshot.data!;

                      return Column(
                        children: [
                          HeaderSection(
                            title:
                                TxtContents.randomProductTitle, //"You may like"
                            btnTitle: TxtContents.viewAllBtnTxt,
                            showActionBtn: true,
                            btnTxtColor: Colors.grey,
                            onPressed: () {
                              Get.to(AllProducts(
                                title: category.name,
                                futureMethod:
                                    categoryController.getCategoryProducts(
                                        categoryId: category.id, limit: -1),
                              ));
                            },
                          ),
                          const SizedBox(
                            height: Sizes.spaceBetween,
                          ),
                          GridLayout(
                            itemCount: products.length,
                            // mainAxisExtent: 282,
                            itemBuilder: (_, index) =>
                                ProductCartVertical(product: products[index]),
                          )
                        ],
                      );
                    })

                // Obx(() {
                //   if (productController.isLoading.value) {
                //     return VerticalProductShimmer(
                //       itemCount: productController.featuredProducts.length,
                //     );
                //   }
                //   if (productController.featuredProducts.isEmpty) {
                //     return const Text("No Data Found!");
                //   } else {
                //     return GridLayout(
                //       itemCount: productController.featuredProducts.length,
                //       mainAxisExtent: 282,
                //       itemBuilder: (_, index) => ProductCartVertical(
                //         product: productController.featuredProducts[index],
                //       ),
                //     );
                //   }
                // })
              ],
            ),
          ),
        ]);
  }
}
