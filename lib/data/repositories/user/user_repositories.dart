import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/auth/models/user/userModel.dart';

class UserRepositories extends GetxController {
  static UserRepositories get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //save user record(register with email & pwd ) to firestore
  Future<void> addUser(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {}
  }
}
