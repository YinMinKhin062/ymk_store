import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/data/dummyData/dummyData.dart';
import 'package:ymk_store/features/shop/controlllers/bannerController.dart';
import 'package:ymk_store/features/shop/controlllers/brandCategoryController.dart';
import 'package:ymk_store/features/shop/controlllers/brandController.dart';
import 'package:ymk_store/features/shop/controlllers/productCategoryController.dart';
import 'package:ymk_store/features/shop/controlllers/productController.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../../shop/controlllers/categoryController.dart';
import 'widgets/uploadTitle.dart';

class UploadData extends StatelessWidget {
  const UploadData({super.key});

  @override
  Widget build(BuildContext context) {
    final brandCategoryController = Get.put(BrandCategoryController());
    final productCategoryController = Get.put(ProductCategoryController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(TxtContents.uploadDataTxt),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            UploadTile(
              prefixIcon: Iconsax.category,
              suffixIcon: Iconsax.arrow_circle_up,
              text: TxtContents.uploadCategotyTxt,
              onPressed: () => CategoryController.instance
                  .uploadCategory(dummyData.categories),
            ),
            UploadTile(
              prefixIcon: Iconsax.category,
              suffixIcon: Iconsax.arrow_circle_up,
              text: TxtContents.uploadBannerTxt,
              onPressed: () =>
                  BannerController.instance.uploadBanners(dummyData.banners),
            ),
            UploadTile(
              prefixIcon: Iconsax.category,
              suffixIcon: Iconsax.arrow_circle_up,
              text: TxtContents.uploadBrandTxt,
              onPressed: () =>
                  BrandController.instance.uploadBrand(dummyData.brands),
            ),
            UploadTile(
              prefixIcon: Iconsax.category,
              suffixIcon: Iconsax.arrow_circle_up,
              text: TxtContents.uploadProductTxt,
              onPressed: () =>
                  ProductController.instance.uploadProduct(dummyData.products),
            ),
            UploadTile(
              prefixIcon: Iconsax.category,
              suffixIcon: Iconsax.arrow_circle_up,
              text: TxtContents.uploadBrandCategoryTxt,
              onPressed: () => brandCategoryController
                  .uploadBrandsForCategory(dummyData.brandsForCategory),
            ),
            UploadTile(
              prefixIcon: Iconsax.category,
              suffixIcon: Iconsax.arrow_circle_up,
              text: TxtContents.uploadProductCategoryTxt,
              onPressed: () =>productCategoryController
                  .uploadProductForCategory(dummyData.productsForCategories),
            ),
          ],
        ),
      ),
    );
  }
}
