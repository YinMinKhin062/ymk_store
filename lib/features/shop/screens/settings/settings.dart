import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/headerContainer.dart';
import 'package:ymk_store/common/widgets/settings/userProfileTile.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../common/widgets/settings/settingMenuTile.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';

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
            child: Column(
              children: const [
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
                SizedBox(
                  height: kToolbarHeight,
                ),
                UserProfileTile(),

                SizedBox(
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
                SettingMenuTile(
                  icon: Iconsax.safe_home,
                  menuTitle: TxtContents.addressTxt,
                  menuSubtitle: TxtContents.addressSubtitleTxt,
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.shopping_cart,
                  menuTitle: TxtContents.cartTxt,
                  menuSubtitle: TxtContents.cartSubtitleTxt,
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.bag_tick,
                  menuTitle: TxtContents.orderTxt,
                  menuSubtitle: TxtContents.orderSubtitleTxt,
                  onTap: () {},
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
                const HeaderSection(title: TxtContents.appSettingTxt, btnTitle: ""),

                const SizedBox(
                  height: Sizes.spaceBetween,
                ),

                SettingMenuTile(
                  icon: Iconsax.location,
                  menuTitle: TxtContents.locationTxt,
                  menuSubtitle: TxtContents.locationSubtitleTxt,
                  trailing: Transform.scale(
                   scale: .6,
                    child: SizedBox(
                      width: 15,
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
                     scale: .6,
                      child: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
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
