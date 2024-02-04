import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/controlllers/product/allProductController.dart';

import '../../../../../common/widgets/layout/gridLayout.dart';
import '../../../../../common/widgets/products/productCartVertical.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../models/productModel.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key, required this.productLists});
  final List<ProductModel> productLists;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(productLists);

    return Column(
      children: [
        //dropdown list
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: TxtContents.productFilterArray
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )))
              .toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
        ),

        const SizedBox(
          height: Sizes.spaceBetweenSections,
        ),

        Obx(() => GridLayout(
              itemCount: controller.products.length,
              mainAxisExtent: 282,
              itemBuilder: (_, index) =>
                  ProductCartVertical(product: controller.products[index]),
            ))
      ],
    );
  }
}
