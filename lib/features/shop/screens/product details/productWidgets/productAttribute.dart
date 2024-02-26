import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/controlllers/product/variableController.dart';

import '../../../../../common/widgets/text/headerSection.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../models/productModel.dart';
import 'myRawChip.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariableController());
    return Column(
      children: [
        const SizedBox(
          height: Sizes.spaceBetween / 1.5,
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderSection(title: attribute.name!, btnTitle: ""),//eg.attribute.name=Colors
                      const SizedBox(
                        height: Sizes.spaceBetween / 2,
                      ),
                      Obx(
                        () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((value) {
                              final isSelected =
                                  controller.currentAttribute[attribute.name] ==
                                      value;
                                
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(value);

                              return MyRawChip(
                                text: value,
                                isSelected: isSelected,
                                isEnabled: available ? true : false,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              value);
                                        }
                                      }
                                    : null,
                              ); //eg. show "Green"
                            }).toList()),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBetween,
                      ),
                    ],
                  ),
                )
                .toList())
      ],
    );
  }
}
