import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/common/widgets/storeWidget/brandCard.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/shop/controlllers/brandController.dart';
import 'package:ymk_store/features/shop/screens/allBrands/brandProducts.dart';
import 'package:ymk_store/utils/Loading/brandShimmer.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          TxtContents.brandTxt,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const HeaderSection(
                title: TxtContents.brandsTxt,
                btnTitle: "",
              ),
              const SizedBox(
                height: Sizes.spaceBetween,
              ),
              Obx(() {
                if (brandController.isLoading.value) {
                  return BrandShimmer(
                    brandItem: brandController.allbrands.length,
                  );
                }
                if (brandController.allbrands.isEmpty) {
                  return const Center(child: Text("No Data Found"));
                } else {
                  return GridLayout(
                    itemCount: brandController.allbrands.length,
                    mainAxisExtent: 60,
                    itemBuilder: (_, index) => BrandCard(
                      onTap: () => Get.to(() =>  BrandProducts(brand: brandController.allbrands[index],)),
                      brand: brandController.allbrands[index],
                    ),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
