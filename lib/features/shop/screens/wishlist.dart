import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/homeWidget/circularIcon.dart';
import 'package:ymk_store/common/widgets/layout/gridLayout.dart';
import 'package:ymk_store/common/widgets/products/productCartVertical.dart';
import 'package:ymk_store/features/shop/screens/home.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';
import 'package:ymk_store/utils/popup/animationLoaderWidget.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';

import '../../../utils/Loading/verticalProductShimmer.dart';
import '../controlllers/product/favouriteController.dart';
import '../controlllers/productController.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = FavouriteController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(TxtContents.wishlistAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 26)),
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
          child: Obx(
            () => FutureBuilder(
                future: wishlistController.favouriteProducts(),
                builder: (context, snapshot) {
                  //nothing found
                  final emptyWidget = AnimationLoaderWidget(
                    width: 150,
                    height: 150,
                    animation: assetImage.noWishlist,
                    text: "Whoops!.Wishlist is Empty....",
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () =>
                        Get.offAll(() => const NavigationMenu()),
                  );

                  final res = CloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: const VerticalProductShimmer(),
                      nothingFound: emptyWidget);
                  if (res != null) return res;
                

                  final products = snapshot.data!;
                  return GridLayout(
                    itemCount: products.length,
                    mainAxisExtent: 282,
                    itemBuilder: (_, index) =>
                        ProductCartVertical(product: products[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
