import 'package:get/get.dart';

import '../../../data/repositories/brand/brandRepository.dart';
import '../../../utils/networkConnection/loaders.dart';
import '../models/brandCategoryModel.dart';

class BrandCategoryController extends GetxController {
  static BrandCategoryController get instance => Get.find();

  final brandRepo=Get.put(BrandRepository());
  Future<void> uploadBrandsForCategory(List<BrandCategoryModel> brands) async {
    try {
      await brandRepo.uploadDummyBrandDataForCateogry(brands);
      Loaders.successSnackBar(
          title: "Uploaded!", message: "Brands for cateogry are uploaded!");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
