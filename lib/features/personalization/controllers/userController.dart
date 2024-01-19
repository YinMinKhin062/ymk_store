import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ymk_store/data/repositories/user/user_repositories.dart';
import 'package:ymk_store/features/auth/models/user/userModel.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';

class UserController extends GetxController {
  UserController get instance => Get.find();

  final userRepositories = Get.put(UserRepositories());

  Future<void> addUserRecord(UserCredential? userCredential) async {
    try {
      if(userCredential!=null){
        final newUser = UserModel(
          id: userCredential.user!.uid,
          userName: userCredential.user!.displayName ?? '',
          email: userCredential.user!.email ?? '',
          phoneno: userCredential.user!.phoneNumber ?? '',
          profilepic: userCredential.user!.photoURL ?? '');

      //add user data to firebase
      userRepositories.addUser(newUser);
      }
    } catch (e) {
      Loaders.warningSnackBar(title: 'On snap!',message: 'Your Data not saved');
    }
  }
}
