import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ymk_store/features/shop/models/brandModel.dart';
import 'package:ymk_store/features/shop/models/productAttributeModel.dart';

import 'productVariationModel.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.stock,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  toJson() {
    return {
      'Title': title,
      'Price': price,
      'Stock': stock,
      'Thumbnail': thumbnail,
      'ProductType': productType,
      'Sku': sku,
      'Brand': brand!.toJson(),
      'Images': images ?? [],
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Description': description,
      'Date': date,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

//Map Json oriented doc snapshot from firebase to model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    if (doc.data() != null) {
      return ProductModel(
        id: doc.id,
        title: data['Title'],
        // price: double.parse((data['Price'] ?? 0.0).toString()),
        price: data['Price'] ?? 0.0,
        stock: data['Stock'] ?? 0,
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '',
        sku: data['Sku'],
        brand: BrandModel.fromJson(data['Brand']),
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        // salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        salePrice: data['SalePrice'] ?? 0.0,
        isFeatured: data['IsFeatured'] ?? false,
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList(),
        date: (data['Date'] as Timestamp).toDate(),
      );
    } else {
      return ProductModel.empty();
    }
  }

//Map json-oriented doc snapshot from firebase to model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return ProductModel(
      id: doc.id,
      title: data['Title'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['Sku'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
      date: (data['Date'] as Timestamp).toDate(),
    );
  }

  static ProductModel empty() => ProductModel(
      id: '', title: '', price: 0.0, stock: 0, thumbnail: '', productType: '');
}
