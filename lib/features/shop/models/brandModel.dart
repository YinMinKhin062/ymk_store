import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String id;
  final String image;
  final bool isFeatured;
  final String name;
  final int productCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.isFeatured,
      required this.name,
      required this.productCount});

  Map<String, dynamic> toJson() {
    return {
      'Id':id,
      'Image': image,
      'IsFeatured': isFeatured,
      'Name': name,
      'ProductCount': productCount
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> doc) {
    if (doc.isEmpty) {
      return BrandModel.empty();
    }
    final data = doc;
    return BrandModel(
        id: data['Id']??'',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        name: data['Name'] ??'',
        productCount: data['ProductCount'] ?? 0);
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() != null) {
      final data = doc.data()!;
      return BrandModel(
          id: doc.id,
          image: data['Image'] ?? "",
          isFeatured: data['IsFeatured'] ?? false,
          name: data['Name'] ?? "",
          productCount: data['ProductCount'] ?? 0);
    } else {
      return BrandModel.empty();
    }
  }

  static BrandModel empty() => BrandModel(
      id: '', image: '', isFeatured: false, name: '', productCount: 0);
}
