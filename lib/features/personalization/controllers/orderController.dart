import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
import 'package:ymk_store/features/auth/screens/SignUp/successScreen.dart';
import 'package:ymk_store/features/personalization/controllers/addressController.dart';
import 'package:ymk_store/features/shop/controlllers/checkoutController.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/enum.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/popup/fullScreenLoader.dart';

import '../../../data/repositories/Order/orderRepository.dart';
import '../../../utils/networkConnection/loaders.dart';
import '../../shop/controlllers/cartController.dart';
import '../models/orderModel.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final orders = await orderRepository.getUserOrders();

      if (kDebugMode) {
        print("order controller = ${orders}, ${orders.length}");
      }
      return orders;
    } catch (e) {
      Loaders.warningSnackBar(title: "On Snap in fetching orders!", message: e.toString());
      return [];
    }
  }

  //add methods for order processing
  void processingOrder(double totalAmount) async {
    try {
      // FullScreenLoader.openLoadingDialog(
      // 'Processing your order', assetImage.noWishlist);

      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          paymentMethod: checkoutController.selectedPaymentmethod.value.name,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          deliveryDate: DateTime.now(),
          address: addressController.selectedAddress.value,
          items: cartController.cartItems.toList());

      if (kDebugMode) {
        print(order);
      }

      //save order
      await orderRepository.addOrder(order, userId);

      cartController.clearCart();
      if (kDebugMode) {
        print(cartController.cartItems.length);
        print(cartController.noOfCartItems);
      }

      
      if (kDebugMode) {
        print(cartController.cartItems);
      }
      // FullScreenLoader.stopLoading();

      Get.off(
        () => SuccesScreen(
          title: "Order Success",
          subtitle: "You item will be shipped soon!",
          image: assetImage.orderSuccessImg,
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      
      Loaders.errorSnackBar(title: 'On Snap',message: e.toString());
    }
  }
}
