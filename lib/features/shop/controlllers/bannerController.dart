import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/banner/bannerRepository.dart';
import 'package:ymk_store/features/shop/models/bannerModel.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final bannerRepo = Get.put(BannerRepository());

  final RxList<BannerModel> activeBanners = <BannerModel>[].obs;

  //variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (kDebugMode) {
      print("fetching banners");
    }
    fetchBanners();
  }

  //update page
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final banners = await bannerRepo.getBanners();

      // print("banners $banners");

      activeBanners.assignAll(banners);
      // print("activeBanners $activeBanners");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      await bannerRepo.uploadDummyBannerData(banners);

      Loaders.successSnackBar(
          title: "Uploaded", message: "Banners are uploaded");

      fetchBanners();
      activeBanners.refresh();
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Oh Snap!", message: "Can't upload category! $e");
    }
  }
}
