import 'package:get/get.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';
import 'package:ymk_store/utils/constants/enum.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';

import '../../../data/repositories/product/productRepository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;

  final productRepo = Get.put(ProductRepository());

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFeaturedProducts();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepo.getFeaturedProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'On Snap in getting Featured product!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final products = await productRepo.getAllProducts();

      return products;
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'On Snap in getting all products!', message: e.toString());
      return [];
    }
  }

  Future<void> uploadProduct(List<ProductModel> products) async {
    try {
      await productRepo.uploadProductDummyData(products);

      Loaders.successSnackBar(
          title: "Uploaded", message: "Products are uploaded");

      featuredProducts.refresh();

      fetchFeaturedProducts();
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Oh Snap!", message: "Can't upload products! $e");
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largetPrice = 0.0;

    //product is single
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      //calculate smallest and largest price among variations
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largetPrice) {
          largetPrice = priceToConsider;
        }
      }

      //smallest and largest are the same, return a value
      if (smallestPrice.isEqual(largetPrice)) {
        return largetPrice.toString();
      } else {
        return (smallestPrice - largetPrice).toString();
      }
    }
  }

  String? calculateSalePercent(double price, double salePrice) {
    if (price <= 0) return null;
    if (salePrice <= 0) return null;

    double percentage = ((price - salePrice) / price) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'Instock' : 'Out of stock';
  }
}
