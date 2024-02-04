import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/homeWidget/shoppingCartWidget.dart';
import 'package:ymk_store/common/widgets/searchBar/searchBar.dart';
import 'package:ymk_store/common/widgets/storeWidget/brandCard.dart';
import 'package:ymk_store/common/widgets/storeWidget/tabCategory.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/personalization/screens/cart/cart.dart';
import 'package:ymk_store/features/shop/controlllers/categoryController.dart';
import 'package:ymk_store/features/shop/screens/allBrands/allBrands.dart';
import 'package:ymk_store/utils/Loading/brandShimmer.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../common/widgets/layout/gridLayout.dart';
import '../../../common/widgets/storeWidget/tabBar.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../controlllers/brandController.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    final brands = brandController.featuredBrands;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            TxtContents.storeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 27),
          ),
          actions: [
            ShoppingCartWidget(
              iconColor: Colors.black,
              onPressed: () {
                Get.to(() => const Cart());
              },
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                expandedHeight: 380,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: Sizes.spaceBetween,
                      ),

                      //search bar
                      const SearchBar(
                          title: 'Search in Store',
                          icon: Iconsax.search_normal),
                      const SizedBox(
                        height: Sizes.spaceBetweenSections,
                      ),

                      //Featured brands
                      HeaderSection(
                        title: TxtContents.featuredBrandTxt,
                        showActionBtn: true,
                        btnTitle: TxtContents.viewAllBtnTxt,
                        onPressed: () {
                          Get.to(() => const AllBrands());
                        },
                        btnTxtColor: Colors.black.withOpacity(.3),
                      ),

                      const SizedBox(
                        height: Sizes.spaceBetween / 1.5,
                      ),

                      Obx(() {
                        if (brandController.isLoading.value) {
                          return BrandShimmer(
                            brandItem: brands.length,
                          );
                        }
                        if (brandController.featuredBrands.isEmpty) {
                          return const Text("No Data Found");
                        } else {
                          return GridLayout(
                            itemCount: brands.length,
                            mainAxisExtent: 60,
                            itemBuilder: (_, index) => BrandCard(
                              brand: brands[index],
                            ),
                          );
                        }
                        //  else {
                        // return GridLayout(
                        //     itemCount: brands.length,
                        //     mainAxisExtent: 60, //60
                        //     itemBuilder: (_, index) {
                        //       if (brandController.isLoading.value) {
                        //         return const MyShimmerEffect(
                        //           width: 100,
                        //           height: 50,
                        //           radius: 10,
                        //         );
                        //       }
                        //       if (brandController.featuredBrands.isEmpty) {
                        //         return const Text("No Data Found");
                        //       } else {
                        //         return BrandCard(
                        //           brandImg: brands[index].image,
                        //           brandName: brands[index].name,
                        //           brandProductCounts:
                        //               brands[index].productCount.toString(),
                        //         );
                        //       }
                        //     });
                        // }
                      }),
                    ],
                  ),
                ),

                //tab bar
                bottom: myTabBar(
                  tabs: categories
                      .map((category) => Tab(
                            child: Text(
                              category.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ))
                      .toList(),
                ),
              )
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => TabCategory(category: category))
                  .toList()),
        ),
      ),
    );
  }
}
