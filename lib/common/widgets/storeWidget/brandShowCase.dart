import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/screens/allBrands/brandProducts.dart';

import '../../../features/shop/models/brandModel.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../customShapes/containers/circularContainer.dart';
import 'brandCard.dart';
import 'brandTopProductImage.dart';

class BrandShowcase extends StatelessWidget {
  final List<String> images;
  final BrandModel brand;

  const BrandShowcase({super.key, required this.images,required this.brand});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>BrandProducts(brand: brand)),
      child: CircularContainer(
        radius: 10,
        height: 190,
        showBorder: true,
        margin: const EdgeInsets.only(bottom: Sizes.spaceBetween),
        padding: const EdgeInsets.all(Sizes.md),
        child: Column(
          children: [
            //brand with counts
             Expanded(
              child: BrandCard(
                showBorder: false, brand: brand,
              ),
            ),
    
            //top three products
            Row(
              children: images
                  .map((image) => Expanded(child: brandTopProductImage(image: image)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
