import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/common/widgets/storeWidget/brandCard.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/shop/screens/allBrands/brandProducts.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(TxtContents.brandTxt,style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const HeaderSection(title: TxtContents.brandsTxt, btnTitle: "",),
              const SizedBox(height: Sizes.spaceBetween,),
              GridLayout(itemCount: 10, 
              mainAxisExtent: 60,
               itemBuilder: (p0, p1) =>  BrandCard(onTap: () => Get.to(()=>const BrandProducts()),),)
            ],
          ),
        ),
      ),
    );
  }
}