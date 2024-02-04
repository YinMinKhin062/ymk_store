
class ProductAttributeModel {
  // String id;
  String? name;
  final List<String>? values;
  ProductAttributeModel({this.name, this.values});

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> doc) {
    if (doc.isEmpty) {
      return ProductAttributeModel.empty();
    } else {
      final data = doc;
      return ProductAttributeModel(
          name: data.containsKey('Name') ? data['Name'] : '',
          values: List<String>.from(data['Values']));
    }
  }

  // factory ProductAttributeModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> doc) {
  //   if (doc.data() != null) {
  //     final data = doc.data()!;
  //     return ProductAttributeModel(
  //         name: data.containsKey('Name') ? data['Name'] : "",
  //         values: List<String>.from(data['Values']));
  //   } else {
  //     return ProductAttributeModel.empty();
  //   }
  // }

  static ProductAttributeModel empty() =>
      ProductAttributeModel(name: '', values: <String>[]);
}
