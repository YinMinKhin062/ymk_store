import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      final featuredProducts = snapshot.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();

      return featuredProducts;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();

      final featuredProducts = snapshot.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();

      return featuredProducts;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();

      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIDs) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIDs)
          .get();
      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

     
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getProductsForBrands(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get(); //limit -1 => "retrieve all matching documents."

      final productBrandLists = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productBrandLists;
    } on FirebaseException catch (e) {
      throw e.code;
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get(); //limit -1 => "retrieve all matching documents."

      List<String> productIdLists = productCategoryQuery.docs
          .map((doc) => doc['ProductId'] as String)
          .toList();

      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIdLists)
          .get();
      List<ProductModel> products = productQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw e.code;
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadProductDummyData(List<ProductModel> products) async {
    try {
      for (var product in products) {
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.code;
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      throw e.toString();
    }
  }
}
