import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxController {
  static FirebaseStorageService get instance => Get.find();

  final _firebasestorage = FirebaseStorage.instance;

  //upload local asset from IDE
  //return a Unit8List containing image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imgData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imgData;
    } catch (e) {
      // throw "Error loading image $e";
      if (e is FirebaseException) {
        throw 'Firebase Exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Socket exception ${e.message}';
      } else {
        throw 'Something went wrong!.Please try again';
      }
    }
  }

  //upload image using imagedata on cloud firebase storage
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebasestorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // throw "Error loading image $e";
      if (e is FirebaseException) {
        throw 'Firebase Exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Socket exception ${e.message}';
      } else {
        throw 'Something went wrong!.Please try again';
      }
    }
  }
}
