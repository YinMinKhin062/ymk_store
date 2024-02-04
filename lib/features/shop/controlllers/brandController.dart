import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/product/productRepository.dart';
import 'package:ymk_store/features/shop/models/brandCategoryModel.dart';
import 'package:ymk_store/features/shop/models/brandModel.dart';

import '../../../data/repositories/brand/brandRepository.dart';
import '../../../utils/networkConnection/loaders.dart';
import '../models/productModel.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final brandRepo = Get.put(BrandRepository());

  RxBool isLoading = false.obs;

  RxList<BrandModel> allbrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  RxList<BrandCategoryModel> brandscategories = <BrandCategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBrand();
  }

  Future<void> fetchBrand() async {
    try {
      isLoading.value = true;
      final brands = await brandRepo.getBrands();

      allbrands.assignAll(brands);

      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured).take(4).toList());
      featuredBrands.refresh();
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadBrand(List<BrandModel> brands) async {
    try {
      await brandRepo.uploadDummyBrandData(brands);
      Loaders.successSnackBar(
          title: 'Uploaded', message: 'Brands are uploaded!');
      fetchBrand();
      allbrands.refresh();
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //get brands for category
  Future<List<BrandModel>>? getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepo.getBrandsForCategory(categoryId);
      if (brands != null) {
        return brands;
      } else {
        return [];
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Oh Snap in Brand Category!", message: e.toString());
      return [];
    }
  }

  //get products according to brands
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final productRepo = ProductRepository.instance;
      final brandProducts =
          await productRepo.getProductsForBrands(brandId: brandId);

      return brandProducts;
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Oh Snap in Product for brand!", message: e.toString());
      return [];
    }
  }
}
