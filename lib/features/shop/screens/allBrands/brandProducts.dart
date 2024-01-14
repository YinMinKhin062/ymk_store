import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/storeWidget/brandCard.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../allProducts/widgets/sortableProducts.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(TxtContents.brandIOS),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: const [
            BrandCard(),
            SizedBox(height: Sizes.spaceBetweenSections,),
            SortableProducts(),
          ],
        ),
      ),),
    );
  }
}