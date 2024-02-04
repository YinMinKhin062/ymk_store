import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/category/categoryRepository.dart';
import 'package:ymk_store/features/shop/models/productCategoryModel.dart';

import '../../../utils/networkConnection/loaders.dart';

class ProductCategoryController extends GetxController{
  static ProductCategoryController get instance=>Get.find();
  
  final categoryRepo=Get.put(CategoryRepository());

  Future<void> uploadProductForCategory(List<ProductCategoryModel> productcategory) async {
    try {
      await categoryRepo.uploadDummyDataForProductCategory(productcategory);
      Loaders.successSnackBar(
          title: "Uploaded!", message: "Products for cateogry are uploaded!");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}