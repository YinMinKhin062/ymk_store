import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String categoryId;
  final String productId;

  ProductCategoryModel({required this.categoryId, required this.productId});

  Map<String, dynamic> toJson() {
    return {
      'CategoryId': categoryId,
      'ProductId': productId,
    };
  }

  factory ProductCategoryModel.fromSnapshot(
      DocumentSnapshot <Map<String,dynamic>>doc) {
    final data = doc.data()!;

    if(data!=null){
         return ProductCategoryModel(
        categoryId: data['CategoryId'] ,
        productId: data['ProductId'] );
    }else{
      return ProductCategoryModel.empty();
    }
   
  }
  
  static ProductCategoryModel empty() =>ProductCategoryModel(categoryId: '', productId: '');
}
