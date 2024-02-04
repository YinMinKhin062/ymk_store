// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:ymk_store/common/widgets/storeWidget/tabBar.dart';
// import 'package:ymk_store/features/shop/models/productModel.dart';
// import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/productAttribute.dart';
// import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/productImageSlider.dart';
// import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/productMetadata.dart';
// import 'package:ymk_store/features/shop/screens/product%20details/productWidgets/rateAndShare.dart';
// import 'package:ymk_store/utils/constants/txtContents.dart';

// import '../../../../common/widgets/homeWidget/appbar.dart';
// import '../../../../common/widgets/homeWidget/circularIcon.dart';
// import '../../../../utils/theme/custom_themes/sizes.dart';
// import 'productWidgets/productDesc.dart';

// class ProductDetailwithScroll extends StatelessWidget {
//   const ProductDetailwithScroll({super.key,required this.product});

//   final ProductModel product;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: CustomAppBar(
//           showBackArrow: true,
//           actions: [
//             CircularIcon(
//               icon: Iconsax.heart5,
//               color: Colors.red,
//               onPressed: () {},
//             )
//           ],
//         ),
//         body: NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) {
//               return [
//                 SliverAppBar(
//                   automaticallyImplyLeading: false,
//                   floating: true,
//                   pinned: true,
//                   // backgroundColor: Colors.grey.withOpacity(.1),
//                   expandedHeight: 650,
//                   flexibleSpace: ListView(
//                     shrinkWrap: true,
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     children: const [
//                       ProductImageSlider(product: product,),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: Sizes.defaultSpace),
//                         child: RateAndShare(),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: Sizes.defaultSpace),
//                         child: ProductMetadata(),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: Sizes.defaultSpace),
//                         child: ProductAttribute(),
//                       ),
//                     ],
//                   ),
//                   bottom: myTabBar(tabs: [
//                     Tab(
//                       child: Text(
//                         TxtContents.productDescTitle,
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                     ),
//                     Tab(
//                       child: Text(
//                         TxtContents.reviewTitle,
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                     ),
//                   ]),
//                   // ),
//                 )
//               ];
//             },
//             body: const TabBarView(children: [
//               ProductDescription(title: "",productDescTxt: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",),
//               ProductDescription(title: "",productDescTxt: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",),
//             ])),
//       ),
//     );
//   }
// }
