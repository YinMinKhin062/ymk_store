import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/product/productRepository.dart';

import '../../../../utils/networkConnection/loaders.dart';
import '../../models/productModel.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repo = ProductRepository.instance;

  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = repo.fetchProductByQuery(query);
      return products;
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }


  //return product list with sorted by given sortoption
  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption; //give name that want to be sort

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title)); //product name
    }
  }

  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
