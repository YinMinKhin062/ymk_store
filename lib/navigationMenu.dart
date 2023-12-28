import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/shop/screens/wishlist.dart';

import 'features/shop/screens/home.dart';
import 'features/shop/screens/settings/settings.dart';
import 'features/shop/screens/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx( //by using Obx() widget - can listen to the changes within 
                                // this widget(eg.currentindex) using GetX.
       () =>  NavigationBar(
           height:80,
           elevation: 0,
           selectedIndex: controller.currentIndex.value,
           onDestinationSelected:(index) => controller.currentIndex.value=index,
          destinations:const [
            NavigationDestination(icon: Icon(Iconsax.home), label:"Home" ),
            NavigationDestination(icon: Icon(Iconsax.shop), label:"Store" ),
            NavigationDestination(icon: Icon(Iconsax.heart), label:"Wishlist" ),
            NavigationDestination(icon: Icon(Iconsax.user), label:"Profile" ),
          ],),
      ),
        body: Obx(() =>  controller.screens[controller.currentIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> currentIndex=0.obs;
  final screens=[
    const Home(),
    const Store(),
    const Wishlist(),
    const Settings(),
  ];
}