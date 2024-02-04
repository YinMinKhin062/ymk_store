import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/data/repositories/product/productRepository.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';

import '../../../../utils/localStorage/storage_utility.dart';
import '../../models/productModel.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  //variables
  final favourites=<String,bool>{}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initFavourites();
  }

  //() to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json=LocalStorage.instance().readData('favourites');

    if(json!=null){
      final storedFavourites=jsonDecode(json) as Map<String,dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) =>MapEntry(key, value as bool) ));
    }
  }

bool isFavourite(String productId){
  return favourites[productId] ?? false;
}

void toggleFavouriteProduct(String productId){
  if(!favourites.containsKey(productId)){
      favourites[productId]=true;
      saveFavouritesToStorage();
      Loaders.customToast(message:'Product has been added to the Wishlist.' );
  }else{
    LocalStorage.instance().removeData(productId);
    favourites.remove(productId);
    saveFavouritesToStorage();
    favourites.refresh();
    Loaders.customToast(message: 'Product has been removed from the Wishlist.');
  }
  
}

  void saveFavouritesToStorage() {
    final encodedFavourites=json.encode(favourites);
    LocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }

}
