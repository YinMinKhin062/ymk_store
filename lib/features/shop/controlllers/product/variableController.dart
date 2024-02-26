import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/shop/controlllers/cartController.dart';
import 'package:ymk_store/features/shop/models/productModel.dart';
import 'package:ymk_store/features/shop/models/productVariationModel.dart';

class VariableController extends GetxController {
  static VariableController get instance => Get.find();

  RxMap currentAttribute = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> currentVariation =
      ProductVariationModel.empty().obs;

  // currentAttribute[attributeName]=0;

//select attribute and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
       
    final selectedAttribute = Map<String, dynamic>.from(currentAttribute);
    selectedAttribute[attributeName] = attributeValue;
    currentAttribute[attributeName] = attributeValue;

    if (kDebugMode) {
      print("Current Attribute $currentAttribute");
      // print("Current Attribute $selectedAttribute");
    }

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          isSameAttributeValues(variation.attributeValues, selectedAttribute),
      orElse: () => ProductVariationModel.empty(),
    );

    //show selected variation image as main img
    // if (selectedVariation.image!.isNotEmpty) {
    //   ImageController.instance.currentProductImage.value =
    //       selectedVariation.image!;
    // }

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    //assign selected vaiation
    currentVariation.value = selectedVariation;

    getProductVariationStockStatus();
    
  }

//check if selected attributes matches any variation attributes
  bool isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  //check attribute availability
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

//variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        currentVariation.value.stock > 0 ? 'In Stock' : "Out of stock";
    if (kDebugMode) {
      print(variationStockStatus);
    }
  }

  //resetSelected Attributes
  void resetSelectedAttributes() {
    currentAttribute.clear();
    variationStockStatus.value = '';
    currentVariation.value = ProductVariationModel.empty();
  }
}
