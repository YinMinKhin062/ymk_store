import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/models/categoryModel.dart';
import 'package:ymk_store/utils/storage/firebaseStorageService.dart';

import '../../../features/shop/models/productCategoryModel.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

//variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

//get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list =
          snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  //upload categories to  cloud firebase storage
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(FirebaseStorageService());

      for (var category in categories) {
        //get imagedata link from local asset
        // final fileLink = await storage.getImageDataFromAssets(category.image);

        //upload image and get its url
        // final url = await storage.uploadImageData(
        //     'Categories', fileLink, category.name);

        category.image = category.image;

        //upload to firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw '$e';
    }
  }

  //upload categories to  cloud firebase storage
  Future<void> uploadDummyDataForProductCategory(
      List<ProductCategoryModel> productscategories) async {
    try {
      for (var productCategory in productscategories) {
        //upload to firestore
        await _db.collection("ProductCategory").add(productCategory.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw '$e';
    }
  }

  //get subcategories
  Future<List<CategoryModel>> getSubCategoires(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map((subcategory) => CategoryModel.fromSnapshot(subcategory))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
