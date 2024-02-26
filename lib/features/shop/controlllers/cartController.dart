import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/features/personalization/screens/cart/widgets/cartItem.dart';
import 'package:ymk_store/features/shop/models/cartItemModel.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/localStorage/storage_utility.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';

import '../../../utils/constants/enum.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../models/productModel.dart';
import 'product/variableController.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariableController.instance;

  CartController() {
    loadCartItems();
  }

//add items in cart
  void addToCart(ProductModel product) {
    //quantity check
    if (productQuantityInCart < 1) {
      Loaders.customToast(message: "Select Quantity");
      return;
    }

    //varition selected
    if (product.productType == ProductType.variable.toString() &&
        variationController.currentVariation.value.id.isEmpty) {
      Loaders.customToast(message: 'Select Variation');
    }

    //out of stock status
    if (product.productType == ProductType.variable.toString()) {
      //varation product
      if (variationController.currentVariation.value.stock < 1) {
        Loaders.customToast(message: "Out of stock");
        return;
      }
    } else {
      //single product
      if (product.stock < 1) {
        Loaders.warningSnackBar(
            title: 'Out of Stock',
            message: 'Selected variation is out of stock');
        return;
      }
    }

    //convert productModel to cartItemModel
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    //check if cartitem is already added
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      //selectedcartItem is already added cartitems list

      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      // selectedItem is not added to cartItems list
      cartItems.add(selectedCartItem);
    }

    updateCart();

    Loaders.customToast(message: "Prdouct has been added to the cart.");
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == cartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartitem) =>
        cartitem.productId == item.productId &&
        cartitem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // cartItems[index].quantity == 1
        //     ? removeFromCartDialog(index)
        //     : cartItems.removeAt(index);
        if (cartItems[index].quantity == 1) {
          removeFromCartDialog(index);
        }
      }
      updateCart();
    }
  }

  //convert productModel to cartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      //in case it will be variable product
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.currentVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      image: product.thumbnail,
      quantity: quantity,
      variationId: variation.id,
      brandName: product.brand != null ? product.brand!.name : null,
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart() {
    updateCartTotals(); //calcuated prices
    saveCartItems(); //save local storage
    cartItems.refresh(); //refresh cartitem list
  }

  void updateCartTotals() {
    double calculatedTotalPrices = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrices += item.price * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrices;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    LocalStorage.instance().saveData('CartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemsString =
        LocalStorage.instance().readData<List<dynamic>>('CartItems');

    if (cartItemsString != null) {
      cartItems.assignAll(cartItemsString.map((cartItem) =>
          CartItemModel.fromJson(cartItem as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );

    return foundItem.quantity;
  }


  void clearCart() {
    productQuantityInCart.value = 0;
    // noOfCartItems.value=0;
    cartItems.clear();
    updateCart();
  }

  removeFromCartDialog(int index) {
    Get.defaultDialog(
      barrierDismissible: false,
      titlePadding: const EdgeInsets.only(top: Sizes.spaceBetween),
      title: TxtContents.removeDialogTitle,
      middleText: TxtContents.removeDialogTxt,
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Loaders.customToast(message: TxtContents.removeDialogSuccessTxt);
        Get.back();
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  removeFromProductDetailCartDialog(ProductModel product) {
    //convert productModel to cartItemModel
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    Get.defaultDialog(
      barrierDismissible: false,
      titlePadding: const EdgeInsets.only(top: Sizes.spaceBetween),
      title: TxtContents.removeDialogTitle,
      middleText: TxtContents.removeDialogTxt,
      onConfirm: () {
        cartItems.removeAt(index);
        productQuantityInCart.value=0;
        updateCart();
        Loaders.customToast(message: TxtContents.removeDialogSuccessTxt);
        Get.back();
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      //if single product
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.currentVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
