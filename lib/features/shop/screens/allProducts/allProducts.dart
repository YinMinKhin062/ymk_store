import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import 'widgets/sortableProducts.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // List <String> productFilterArray=['Name','Higher Price','Lower Price','Sale','Newest','Popularity'];
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text(
          TxtContents.productsTxt,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: SortableProducts(),
        ),
      ),
    );
  }
}
