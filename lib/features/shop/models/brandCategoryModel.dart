import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'BrandId': brandId,
      'CategoryId': categoryId,
    };
  }

  factory BrandCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    if (doc.data() != null) {
      return BrandCategoryModel(
          brandId: data['BrandId'], categoryId: data['CategoryId']);
    } else {
      return BrandCategoryModel.empty();
    }
  }

  static BrandCategoryModel empty() =>
      BrandCategoryModel(brandId: '', categoryId: '');
}
