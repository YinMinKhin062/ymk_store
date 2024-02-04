import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/storeWidget/brandCard.dart';
import 'package:ymk_store/features/shop/controlllers/brandController.dart';
import 'package:ymk_store/utils/Loading/verticalProductShimmer.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../models/brandModel.dart';
import '../allProducts/widgets/sortableProducts.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(
                brand: brand,
              ),
              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),
              FutureBuilder(
                  future: controller.getBrandProducts( brandId: brand.id),
                  builder: (_, snapshot) {
                    const loader = VerticalProductShimmer();
                    final widget = CloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return SortableProducts(
                      productLists: products,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
