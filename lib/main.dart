import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';

import 'firebase_options.dart';
import 'myapp.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  //widget bindings to use splash screen
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //GetX local storage
  await GetStorage.init();

  //await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //initialize app check
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,);

  runApp(const MyApp());
}
