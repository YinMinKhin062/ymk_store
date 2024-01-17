import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:ymk_store/features/auth/screens/onboarding.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/theme/theme.dart';

import 'bindings/generalBindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // precacheImage(const AssetImage(assetImage.verifyEmail), context);
    // precacheImage(const AssetImage(assetImage.successfullyCreateAcc), context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      ),
      navigatorKey: Get.key,
    );
  }
}
