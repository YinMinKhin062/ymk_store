import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/models/bannerModel.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getBanners() async {
    try {
      // final result = await _db.collection("Banners").get();
       final snapshot= await _db.collection('Banners').where('Active',isEqualTo: true).get();
      // final banners= result.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();

      // final snapshot = await _db.collection("Banners").get();
      final list =
          snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
      
      return list;
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadDummyBannerData(List<BannerModel> banners) async {
    try {
      for (var banner in banners) {
        await _db.collection("Banners").doc(banner.id).set(banner.toJson());
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
