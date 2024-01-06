import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/homeWidget/circularIcon.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/common/widgets/products/productCartVertical.dart';
import 'package:ymk_store/features/shop/screens/home.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(TxtContents.wishlistAppBarTitle,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 26)),
        actions: [
          CircularIcon(
            icon: Icons.add,
            onPressed: () => Get.to(const Home()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                itemCount: 2,
                 mainAxisExtent: 282,
                  itemBuilder: (_, index) =>const ProductCartVertical(),)
            ],
          ),
        ),
      ),
    );
  }
}
