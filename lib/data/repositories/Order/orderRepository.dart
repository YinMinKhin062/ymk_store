import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';

import '../../../features/personalization/models/orderModel.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

//fetch order from firestore
  Future<List<OrderModel>> getUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) throw 'Not Found Users';
      final ordersSnapshot =
          await _db.collection("Users").doc(userId).collection('Orders').get();
      return ordersSnapshot.docs
          .map((order) => OrderModel.fromSnapshot(order))
          .toList();
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

//add order to firestore
  Future<void> addOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
          
    } catch (e) {
      throw e.toString();
    }
  }
}
