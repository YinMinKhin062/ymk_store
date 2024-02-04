import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/utils/Loading/verticalProductShimmer.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../controlllers/product/allProductController.dart';
import '../../models/productModel.dart';
import 'widgets/sortableProducts.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    // List <String> productFilterArray=['Name','Higher Price','Lower Price','Sale','Newest','Popularity'];
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          TxtContents.productsTxt,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                //check the state of future builder snapshot
                const loader = VerticalProductShimmer();

                final widget = CloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                if (widget != null) return widget;

                //product found
                final products = snapshot.data!;
                return SortableProducts(
                  productLists: products,
                );
              },
            )),
      ),
    );
  }
}
