import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ymk_store/features/personalization/models/addressModel.dart';
import 'package:ymk_store/features/personalization/screens/cart/cart.dart';
import 'package:ymk_store/utils/constants/enum.dart';

import '../../shop/models/cartItemModel.dart';

class OrderModel extends GetxController {
  final String id;
  final String userId;
  final String paymentMethod;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final List<CartItemModel> items;
  final AddressModel? address;

  OrderModel({
    required this.id,
    this.userId = '',
    this.paymentMethod = "Paypal",
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.deliveryDate,
    required this.items,
    this.address,
  });

  String get formattedOrderDate=> DateFormat.yMMMd().format(orderDate);
  String get formattedShippedDate=> DateFormat.yMMMd().format(deliveryDate);

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipped on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UserId': userId,
      'PaymentMethod': paymentMethod,
      'Status': status.toString(),
      'TotalAmount': totalAmount,
      'OrderDate': orderDate,
      'DeliveryDate': deliveryDate,
      'Items': items.map((item) => item.toJson()).toList(),
      'Address': address!.toJson(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    if (doc.data() != null) {
      return OrderModel(
        id: data['Id'],
        userId: data['UserId'],
        paymentMethod: data['PaymentMethod'],
        status: OrderStatus.values
            .firstWhere((element) => element.toString() == data['Status']),
        totalAmount: data['TotalAmount'],
        orderDate: (data['OrderDate'] as Timestamp).toDate(),
        deliveryDate: (data['DeliveryDate'] as Timestamp).toDate(),
        address:data['Address']==null? null: AddressModel.fromMap(data['Address'] as Map<String, dynamic>),
        items: (data['Items'] as List<dynamic>)
            .map((itemData) =>
                CartItemModel.fromJson(itemData as Map<String, dynamic>))
            .toList(),
      );
    } else {
      return OrderModel(
          id: '',
          status: OrderStatus.pending,
          totalAmount: 0.0,
          orderDate: DateTime.now(),
          deliveryDate: DateTime.now(),
          items: <CartItemModel>[]);
    }
  }
}
