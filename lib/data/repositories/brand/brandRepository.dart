import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/models/brandModel.dart';

import '../../../features/shop/models/brandCategoryModel.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  //variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      final brands =
          snapshot.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
      // print(brands);
      return brands;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadDummyBrandData(List<BrandModel> brands) async {
    for (var brand in brands) {
      try {
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
      } on FirebaseException catch (e) {
        throw e.code;
      } catch (e) {
        throw e.toString();
      }
    }
  }

//upload brandcategory
  Future<void> uploadDummyBrandDataForCateogry(
      List<BrandCategoryModel> brands) async {
    for (var brand in brands) {
      try {
        await _db.collection('BrandCategory').add(brand.toJson());
      } on FirebaseException catch (e) {
        throw e.code;
      } catch (e) {
        throw e.toString();
      }
    }
  }

  Future<List<BrandModel>>? getBrandsForCategory(String categoryId) async {
    try {
      //query to  get all document
     QuerySnapshot snapshot = await _db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      //extract brandIds from document
      List<String> brandIdLists = snapshot.docs.map((doc) => doc['BrandId'] as String).toList();

      if(brandIdLists.isNotEmpty){
           final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIdLists )
          .limit(2)
          .get();

      //extract brand names
      List<BrandModel> brandLists = brandsQuery.docs
          .map((brand) => BrandModel.fromSnapshot(brand))
          .toList();

      return brandLists;
      }else{
        return [];
      }
     

    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }
}
