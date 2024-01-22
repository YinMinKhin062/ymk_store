import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
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

  //fetch user in firestore
  Future<UserModel> fetchUser() async {
    try {
      final docSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser.uid)
          .get();
      if (docSnapshot.exists) {
        return UserModel.fromSnapshot(docSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  //update user in Firestore
  Future<void> updateUser(UserModel updateUser) async {
    try {
      await _db
          .collection("User")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  //update user field
  Future<void> updateUserfield(Map<String, dynamic> userFieldJson) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser.uid)
          .update(userFieldJson);
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> removeUser(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }
}
