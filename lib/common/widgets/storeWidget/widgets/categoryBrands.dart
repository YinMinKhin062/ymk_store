import 'package:flutter/material.dart';
import 'package:ymk_store/features/shop/controlllers/brandController.dart';
import 'package:ymk_store/features/shop/models/categoryModel.dart';
import 'package:ymk_store/utils/Loading/boxShimmer.dart';
import 'package:ymk_store/utils/Loading/listTileShimmer.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../brandShowCase.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          final loader = Column(
            children: const [
              ListTileShimmer(),
              SizedBox(
                height: Sizes.spaceBetween,
              ),
              BoxShimmer(),
              SizedBox(height: Sizes.spaceBetween),
            ],
          );
          final widget = CloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) => FutureBuilder(
                  future: controller.getBrandProducts(
                      brandId: brands[index].id, limit: 3),
                  builder: (context, snapshot) {
                    //handle error,no record or no error message
                    final res = CloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (res != null) return res;

                    //Record found!
                    final products = snapshot.data!;

                    return BrandShowcase(
                        images: products
                            .map((product) => product.thumbnail)
                            .toList(),
                        brand: brands[index]);
                  }));
        });
  }
}
