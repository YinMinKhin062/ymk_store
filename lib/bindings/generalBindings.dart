import 'package:get/get.dart';
import 'package:ymk_store/features/personalization/screens/checkout/checkout.dart';
import 'package:ymk_store/features/shop/controlllers/checkoutController.dart';
import 'package:ymk_store/features/shop/controlllers/product/variableController.dart';

// lib\features\personalization\controllers\addressController.dart

import '../features/personalization/controllers/addressController.dart';
import '../features/shop/controlllers/product/favouriteController.dart';
import '../utils/networkConnection/networkManager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
    Get.put(VariableController());
    Get.put(AddressController());
    Get.put(CheckoutController());
    Get.put(FavouriteController());
  
  } 
}
