import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';

import '../../../features/personalization/models/addressModel.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) throw 'Not found user info!';

      final results = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();

      return results.docs
          .map((address) => AddressModel.fromSnapshot(address))
          .toList();
    } catch (e) {
      throw 'Some went wrong in fetching address info. $e';
    }
  }

  Future<void> updateSelectedField(String selectedId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;

      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(selectedId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw "Error in Updating selected field";
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Can\'t add Address';
    }
  }
}
