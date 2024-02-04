import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/category/categoryRepository.dart';
import 'package:ymk_store/data/repositories/product/productRepository.dart';
import 'package:ymk_store/features/shop/models/categoryModel.dart';

import '../../../utils/networkConnection/loaders.dart';
import '../models/productModel.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allcategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
  }

  //load category data
  Future<void> fetchCategories() async {
    try {
      //show loader
      isLoading.value = true;

      //fetch categories from firebase
      final catergories = await categoryRepository.getAllCategories();

      //update Rx vlaue
      allcategories.assignAll(catergories);

      //filtered featured categories
      featuredCategories.assignAll(allcategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(6)
          .toList());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadCategory(List<CategoryModel> categories) async {
    try {
      await categoryRepository.uploadDummyData(categories);

      Loaders.successSnackBar(
          title: "Uploaded", message: "Categories are uploaded");

      fetchCategories();
      featuredCategories.refresh();
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Oh Snap!", message: "Can't upload category! $e");
    }
  }


  //get category or sub-category products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId,int limit=4}) async{
    final products=await ProductRepository.instance.getProductsForCategory(categoryId:categoryId,limit:limit);
    return products;
  }

  Future<List<CategoryModel>> getSubCategoires(String categoryId) async{
    try{
        final subCategories=await categoryRepository.getSubCategoires(categoryId);
        return subCategories;
    }catch(e){
      Loaders.errorSnackBar(title: "On Snap",message: e.toString());
      return [];
    }
  }

 
}
