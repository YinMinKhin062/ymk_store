import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/homeWidget/shoppingCartWidget.dart';
import 'package:ymk_store/common/widgets/searchBar/searchBar.dart';
import 'package:ymk_store/common/widgets/storeWidget/brandCard.dart';
import 'package:ymk_store/common/widgets/storeWidget/tabCategory.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../common/widgets/layout/gridLayout.dart';
import '../../../common/widgets/storeWidget/tabBar.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            TxtContents.storeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!.copyWith(fontSize: 27),
          ),
          actions: [
            ShoppingCartWidget(
              iconColor: Colors.black,
              onPressed: () {},
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
                            title: "Featured Brands",
                            showActionBtn: true,
                            btnTitle: TxtContents.viewAllBtnTxt,
                            onPressed: () {},
                            btnTxtColor: Colors.black.withOpacity(.3),
                          ),
                  
                          const SizedBox(
                            height: Sizes.spaceBetween / 1.5,
                          ),
                  
                          GridLayout(
                            itemCount: 4,
                            mainAxisExtent: 60,
                            itemBuilder: (_, int) {
                              return const BrandCard();
                            },
                          ),
                        ],
                      ),
                    ),
                  

                  //tab bar
                  bottom: myTabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          "Mobile",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Accessories",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "TV & Audio",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Appliances",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Displays",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                )
              ];
            },
            body:const TabBarView(
              children: [

               TabCategory(),
               TabCategory(),
               TabCategory(),
               TabCategory(),
               TabCategory(),

            
                
              ],
            )),
      ),
    );
  }
}
