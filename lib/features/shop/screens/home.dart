import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import 'package:ymk_store/common/widgets/homeWidget/homeCategories.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/headerContainer.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/shop/screens/allProducts/allProducts.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
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
                child: Column(
                  children: const [
                    //app bar
                    HomeAppBar(
                      title: TxtContents.appBarSubtitle,
                      subtitle: TxtContents.appBarTitle,
                      color: Colors.white,
                    ),

                    SizedBox(
                      height: Sizes.spaceBetweenSections,
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
                    const HomePromoSlider(banners: [
                      assetImage.carouselImg2,
                      assetImage.carouselImg4,
                      assetImage.carouselImg1
                    ]),

                    const SizedBox(
                      height: Sizes.spaceBetweenSections,
                    ),

                    //header section
                    HeaderSection(
                      title: TxtContents.featuredProductTxt,
                      btnTitle: TxtContents.viewAllBtnTxt,
                      showActionBtn: true,
                      txtColor: Colors.black,
                      btnTxtColor: Colors.black.withOpacity(.5),
                      onPressed: () {Get.to(()=>const AllProducts());},
                    ),

                    const SizedBox(
                      height: Sizes.spaceBetween,
                    ),

                    //product grid view vertical
                    GridLayout(
                      itemCount: 4,
                      mainAxisExtent: 282,
                      itemBuilder: (BuildContext, int) =>
                          const ProductCartVertical(),
                    ),
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
