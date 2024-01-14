import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/layout/gridLayout.dart';
import '../../../../../common/widgets/products/productCartVertical.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //dropdown list
        DropdownButtonFormField(
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
          onChanged: (value) {},
        ),

        const SizedBox(
          height: Sizes.spaceBetweenSections,
        ),

        GridLayout(
          itemCount: 6,
          mainAxisExtent: 282,
          itemBuilder: (p0, p1) => const ProductCartVertical(),
        )
      ],
    );
  }
}
