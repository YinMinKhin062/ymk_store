import 'package:get/get.dart';
import 'package:ymk_store/features/shop/controlllers/productController.dart';
import 'package:ymk_store/features/shop/screens/allProducts/allProducts.dart';
import 'package:ymk_store/features/shop/screens/home.dart';
import 'package:ymk_store/features/shop/screens/settings/settings.dart';
import 'package:ymk_store/features/shop/screens/store.dart';
import 'package:ymk_store/features/shop/screens/wishlist.dart';
import 'package:ymk_store/routes/routes.dart';

import '../utils/constants/txtContents.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const Home(),
    ),
    GetPage(
      name: Routes.store,
      page: () => const Store(),
    ),
    GetPage(
      name: Routes.favourites,
      page: () => const Wishlist(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const Settings(),
    ),
    GetPage(
      name: Routes.allproducts,
      page: () => AllProducts(
        title: TxtContents.productsTxt,
        futureMethod: ProductController.instance.fetchAllProducts(),
      ),
    ),
  ];
}
