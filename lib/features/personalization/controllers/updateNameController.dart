import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/personalization/controllers/userController.dart';
import 'package:ymk_store/features/personalization/screens/profile/profile.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';

import '../../../data/repositories/user/user_repositories.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  //variables
  final updatedName = TextEditingController();
  GlobalKey<FormState> updateNameFormkey = GlobalKey<FormState>();

  //usercontroller
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepositories());

  @override
  void onInit() {
    super.onInit();
    initializeName();
  }

  Future<void> initializeName() async {
    updatedName.text = userController.user.value.userName;
  }

  Future<void> updateName() async {
    try {
      //form validation
      if (!updateNameFormkey.currentState!.validate()) {
        return;
      }

      //update user name in firestore
      Map<String, dynamic> name = {'Username': updatedName.text.trim()};
      await userRepository.updateUserfield(name);

      //update Rx user value
      userController.user.value.userName = updatedName.text.trim();

      Loaders.successSnackBar(
          title: "Congratulations",
          message: "Your name has been successfully updated");

      Get.offUntil(
          MaterialPageRoute(
            builder: (context) => const Profile(),
          ),
          (route) => route.isFirst);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
