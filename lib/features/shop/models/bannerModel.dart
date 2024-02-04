import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String id;
  final bool active;
  final String imgUrl;
  final String targetScreen;

  BannerModel(
      {required this.id,
      required this.active,
      required this.imgUrl,
      required this.targetScreen});

  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'ImgUrl': imgUrl,
      'TargetScreen': targetScreen,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data != null) {
      return BannerModel(
          id: doc.id,
          active: data['Active'] ?? false,
          imgUrl: data['ImgUrl'] ?? "",
          targetScreen: data['TargetScreen'] ?? "");
    } else {
      return BannerModel.empty();
    }
  }

  static BannerModel empty() =>
      BannerModel(id: '', active: false, imgUrl: '', targetScreen: '');
}
