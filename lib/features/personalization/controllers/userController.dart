import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
import 'package:ymk_store/data/repositories/user/user_repositories.dart';
import 'package:ymk_store/features/auth/models/user/userModel.dart';
import 'package:ymk_store/features/auth/screens/loginScreen.dart';
import 'package:ymk_store/features/personalization/screens/profile/widget/reAuth_UserLogin.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/networkConnection/loaders.dart';
import 'package:ymk_store/utils/networkConnection/networkManager.dart';
import 'package:ymk_store/utils/popup/fullScreenLoader.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepositories = Get.put(UserRepositories());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  final ishidePwd = true.obs;

  final verifyEmail = TextEditingController();
  final verifyPwd = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  //save user
  Future<void> addUserRecord(UserCredential? userCredential) async {
    try {
      //fetch user record
      await fetchUser();

      //if no user record, stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final newUser = UserModel(
              id: userCredential.user!.uid,
              userName: userCredential.user!.displayName ?? '',
              email: userCredential.user!.email ?? '',
              phoneno: userCredential.user!.phoneNumber ?? '',
              profilepic: userCredential.user!.photoURL ?? '');

          //add user data to firebase
          userRepositories.addUser(newUser);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'On snap!', message: 'Your Data not saved');
    }
  }

//fetch user
  Future<void> fetchUser() async {
    try {
      profileLoading.value = true; // when fetch, will have profile loading
      final user = await userRepositories.fetchUser();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteWarningPopUp() {
    Get.defaultDialog(
        backgroundColor: Colors.white,
        titlePadding: const EdgeInsets.only(
            top: Sizes.defaultSpace,
            bottom: Sizes.md,
            left: Sizes.defaultSpace,
            right: Sizes.defaultSpace),
        contentPadding: const EdgeInsets.only(
            top: 0, left: Sizes.md, right: Sizes.md, bottom: Sizes.md),
        title: TxtContents.deleteAlertTitle,
        middleText: TxtContents.deleteAlertBody,
        confirm: ElevatedButton(
            onPressed: () async {
              verifyEmail.text = "";
              verifyPwd.text = "";

              Navigator.of(Get.overlayContext!)
                  .pop(); //if not delete, will not show alert box

              //delete user account based on user's register method(provider)
              deleteUserAccount();
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Text(TxtContents.deleteTxt)),
        cancel: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black.withOpacity(.7)),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            ),
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: Text(
              TxtContents.cancelTxt,
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            )));
  }

  //delete user account
  deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog("Deleting...", assetImage.loading1);

      //first re-auth user
      final auth = AuthenticationRepository.instance;

      //get provider according to user's register
      final provider =
          auth.authUser.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        //google
        if (provider == 'google.com') {
          await auth.logInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const Login());
        } else if (provider == 'password') {
          //if signin with email & pwd ,route to reauth page
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthUserLogin()); // show reauth login form
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'On Snap!', message: e.toString());
    }
  }

  //reauth
  Future<void> reAuthEmailAndPwd() async {
    try {
      FullScreenLoader.openLoadingDialog("Deleting...", assetImage.loading1);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reauthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPwd.text.trim());

      await AuthenticationRepository.instance.deleteAccount();

      FullScreenLoader.stopLoading();

      Get.offAll(() => const Login());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //upload pic
  uploadUserProfilePic() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        profileLoading.value = true; //will have profile loading
        final imageUrl = await userRepositories.uploadImage(
            'Users/Images/Profile/', image); //store image in firestorage
        Map<String, dynamic> profilePic = {'ProfilePicture': imageUrl};
        await userRepositories
            .updateUserfield(profilePic); //store image in user's record

        ///Rx value update
        user.value.profilepic = imageUrl;
        user.refresh();
        //success msg
        Loaders.successSnackBar(
            title: TxtContents.uploadedTxt, message: TxtContents.uploadedMsg);
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: "On Snap!", message: "Something went wrong. $e");
    } finally {
      profileLoading.value = false;
    }
  }
}
