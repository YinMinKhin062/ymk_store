import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/headerContainer.dart';
import 'package:ymk_store/common/widgets/settings/userProfileTile.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/data/repositories/authentication/authentication_Repository.dart';
import 'package:ymk_store/features/personalization/screens/address/addressScreen.dart';
import 'package:ymk_store/features/personalization/screens/profile/profile.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../common/widgets/settings/settingMenuTile.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../../personalization/screens/cart/cart.dart';
import '../../../personalization/screens/order/order.dart';
import '../../../personalization/screens/uploadData/uploadData.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          //header
          HeaderContainer(
            height: 160,
            child: Column(
              children: [
                // CustomAppBar(

                //   title: Text(
                //     TxtContents.accountTitle,
                //     style: Theme.of(context)
                //         .textTheme
                //         .headlineMedium!
                //         .copyWith(color: Colors.white),
                //   ),
                // ),

                //profile
                const SizedBox(
                  height: kToolbarHeight,
                ),
                UserProfileTile(
                  onPressed: () => Get.to(const Profile()),
                ),

                const SizedBox(
                  height: Sizes.spaceBetweenSections,
                ),
              ],
            ),
          ),
          //body
          Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              children: [
                const HeaderSection(
                    title: TxtContents.accountSettingTxt, btnTitle: ""),
                const SizedBox(
                  height: Sizes.spaceBetween,
                ),
                //address
                SettingMenuTile(
                  icon: Iconsax.safe_home,
                  menuTitle: TxtContents.addressTxt,
                  menuSubtitle: TxtContents.addressSubtitleTxt,
                  onTap: () {
                    Get.to(() => const AddressScreen());
                  },
                ),
                //cart
                SettingMenuTile(
                  icon: Iconsax.shopping_cart,
                  menuTitle: TxtContents.cartTxt,
                  menuSubtitle: TxtContents.cartSubtitleTxt,
                  onTap: () {
                    Get.to(() => const Cart());
                  },
                ),
                //orders
                SettingMenuTile(
                  icon: Iconsax.bag_tick,
                  menuTitle: TxtContents.orderTxt,
                  menuSubtitle: TxtContents.orderSubtitleTxt,
                  onTap: () {
                    Get.to(() => const Order());
                  },
                ),
                SettingMenuTile(
                  icon: Iconsax.bank,
                  menuTitle: TxtContents.bankAccountTxt,
                  menuSubtitle: TxtContents.bankAccountSubtitleTxt,
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.discount_shape,
                  menuTitle: TxtContents.discountTxt,
                  menuSubtitle: TxtContents.discountSubtitleTxt,
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.notification,
                  menuTitle: TxtContents.notiTxt,
                  menuSubtitle: TxtContents.notiSubtitleTxt,
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.security_card,
                  menuTitle: TxtContents.accountTxt,
                  menuSubtitle: TxtContents.accountSubtitleTxt,
                  onTap: () {},
                ),

                //app settings
                const SizedBox(
                  height: Sizes.spaceBetweenSections,
                ),
                const HeaderSection(
                    title: TxtContents.appSettingTxt, btnTitle: ""),

                const SizedBox(
                  height: Sizes.spaceBetween,
                ),

                //upload data
                 SettingMenuTile(
                    menuTitle: TxtContents.loadDataTxt,
                    menuSubtitle: TxtContents.loadDataSubtitleTxt,
                    icon: Iconsax.document_upload,onTap: () {
                      Get.to(()=>const UploadData());
                    },),

                SettingMenuTile(
                  icon: Iconsax.location,
                  menuTitle: TxtContents.locationTxt,
                  menuSubtitle: TxtContents.locationSubtitleTxt,
                  trailing: SizedBox(
                    width: 15,
                    child: Transform.scale(
                      scale: .63,
                      child: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                SettingMenuTile(
                  icon: Iconsax.image,
                  menuTitle: TxtContents.imgQualityTxt,
                  menuSubtitle: TxtContents.imgQualitySubtitleTxt,
                  trailing: SizedBox(
                    width: 15,
                    child: Transform.scale(
                      scale: .64,
                      child: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                //logout btn
                const SizedBox(
                  height: Sizes.spaceBetweenSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      AuthenticationRepository.instance.logOut();
                      // AuthenticationRepository.instance.screenRedirect();
                      // Get.offAll(const Login());
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
