
class ProductVariationModel {
  final String id;
  String sku;
  String? image;
  // String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = "",
    this.image = "",
    // this.description = "",
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  toJson() {
    return {
      'Id': id,
      'Sku': sku,
      'Image': image,
      // 'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> doc) {
    if (doc.isEmpty) {
      return ProductVariationModel.empty();
    } else {
      final data = doc;
      return ProductVariationModel(
          id: data['Id'] ?? '',
          sku: data['Sku'] ?? '',
          // price: double.parse((data['Price'] ?? 0.0).toString()),
          price: data['Price'] ?? 0.0,
          // salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
          salePrice: data['SalePrice'] ?? 0.0,
          stock: data['Stock'] ?? 0,
          image: data['Image'] ?? '',
          attributeValues: Map<String, String>.from(data['AttributeValues']));
    }
  }

  // factory ProductVariationModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> doc) {
  //   if (doc.data() != null) {
  //     final data = doc.data()!;
  //     return ProductVariationModel(
  //         id: doc.id,
  //         sku: data['Sku'] ?? '',
  //         price: double.parse((data['Price'] ?? 0.0).toString()),
  //         salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
  //         stock: data['Stock'] ?? 0,
  //         attributeValues: Map<String, String>.from(data['AttributeValues']));
  //   } else {
  //     return ProductVariationModel.empty();
  //   }
  // }

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});
}
