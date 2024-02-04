import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import 'package:ymk_store/common/widgets/homeWidget/homeCategories.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/headerContainer.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/shop/controlllers/productController.dart';
import 'package:ymk_store/features/shop/screens/allProducts/allProducts.dart';
import 'package:ymk_store/utils/Loading/verticalProductShimmer.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import '../../../common/widgets/homeWidget/homeAppBar.dart';
import '../../../common/widgets/homeWidget/homePromoSlider.dart';
import '../../../common/widgets/layout/gridLayout.dart';
import '../../../common/widgets/products/productCartVertical.dart';
import '../../../common/widgets/searchBar/searchBar.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //header
              HeaderContainer(
                height: 360,
                child: Column(
                  children: const [
                    //app bar
                    HomeAppBar(
                      title: TxtContents.appBarSubtitle,
                      subtitle: TxtContents.appBarTitle,
                      color: Colors.white,
                    ),

                    SizedBox(
                      height: Sizes.spaceBetween,
                    ),

                    //search bar
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizes.defaultSpace),
                        child: SearchBar(
                          title: TxtContents.searchBarTxt,
                          icon: Iconsax.search_normal,
                        )),

                    SizedBox(
                      height: Sizes.spaceBetweenSections,
                    ),

                    //categories
                    HomeCategories(
                      headingTxt: TxtContents.featuredCategories,
                    ),
                  ],
                ),
              ),

              //body
              Padding(
                padding: const EdgeInsets.all(Sizes.defaultSpace),
                child: Column(
                  children: [
                    //image carousel_slider
                    const HomePromoSlider(
                        // banners: [
                        // assetImage.carouselImg2,
                        // assetImage.carouselImg4,
                        // assetImage.carouselImg1
                        // ]
                        ),

                    const SizedBox(
                      height: Sizes.spaceBetweenSections,
                    ),

                    //header section
                    HeaderSection(
                      title: TxtContents.featuredProductTxt,
                      btnTitle: TxtContents.viewAllBtnTxt,
                      showActionBtn: true,
                      btnTxtColor: Colors.black.withOpacity(.5),
                      onPressed: () {
                        Get.to(() => AllProducts(
                              title: TxtContents.productsTxt,
                              query: FirebaseFirestore.instance
                                  .collection('Products')
                                  .where('IsFeatured', isEqualTo: true)
                                  .limit(2),
                              futureMethod:
                                  productController.fetchAllProducts(),
                            ));
                      },
                    ),

                    const SizedBox(
                      height: Sizes.spaceBetween,
                    ),

                    //product grid view vertical
                    Obx(() {
                      if (productController.isLoading.value) {
                        return VerticalProductShimmer(
                          itemCount: productController.featuredProducts.length,
                        );
                      }
                      if (productController.featuredProducts.isEmpty) {
                        return const Text("No Data Found!");
                      } else {
                        return GridLayout(
                          itemCount: productController.featuredProducts.length,
                          mainAxisExtent: 282,
                          itemBuilder: (_, index) => ProductCartVertical(
                            product: productController.featuredProducts[index],
                          ),
                        );
                      }
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
