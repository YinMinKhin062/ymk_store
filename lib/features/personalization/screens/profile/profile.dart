import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/personalization/controllers/userController.dart';
import 'package:ymk_store/features/personalization/screens/profile/widget/reAuth_UserLogin.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../common/widgets/personalWidgets/profileImage.dart';
import '../../../../common/widgets/personalWidgets/profileMenu.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';
import 'changeName.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: CustomAppBar(
        title:
            Text("Profile", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            //profile Picture
            SizedBox(
              width: double.infinity,
              height: 73,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: const [
                        ProfileImage(
                          imageName: assetImage.user3,
                          bgColor: Colors.black,
                          width: 70,
                          height: 70,
                          padding: 2,
                        ),
                        Positioned(
                            bottom: -2,
                            right: -5,
                            child: CircularContainer(
                              bgColor: Colors.black,
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.photo_camera,
                                size: 16,
                                color: Colors.white,
                              ),
                            ))
                        // TextButton(
                        //   onPressed: () {},
                        //   child: Text(TxtContents.changeProfileImage,style: Theme.of(context).textTheme.labelLarge,),
                        // ),
                        // CircularImage(height: 50, width: 80, padding:Sizes.sm, image:assetImage.user3,isNetworkImage: true,)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //details
            //profile information
            const SizedBox(
              height: Sizes.spaceBetween,
            ),

            const Divider(),

            const SizedBox(
              height: Sizes.spaceBetween,
            ),
            const HeaderSection(title: TxtContents.profileInfo, btnTitle: ""),

            const SizedBox(
              height: Sizes.spaceBetween,
            ),

            ProfileMenu(
              nameTitle: TxtContents.nameTitle,
              nameValue: controller.user.value.userName,
              onPressed: () {
                Get.to(() => const ChangeName());
              },
            ),

            //Personal Information
            const Divider(),

            const SizedBox(
              height: Sizes.spaceBetween,
            ),
            const HeaderSection(title: TxtContents.personalInfo, btnTitle: ""),

            const SizedBox(
              height: Sizes.spaceBetween,
            ),

            ProfileMenu(
              nameTitle: TxtContents.userIDTitle,
              nameValue: controller.user.value.id,
              icon: Iconsax.copy,
              onPressed: () {},
            ),
            ProfileMenu(
              nameTitle: TxtContents.emailTitle,
              nameValue: controller.user.value.email,
              onPressed: () {},
            ),
            ProfileMenu(
              nameTitle: TxtContents.phoneNoTitle,
              nameValue: controller.user.value.phoneno,
              onPressed: () {},
            ),
            ProfileMenu(
              nameTitle: TxtContents.genderTitle,
              nameValue: TxtContents.genderValue,
              onPressed: () {},
            ),
            ProfileMenu(
              nameTitle: TxtContents.doBTitle,
              nameValue: TxtContents.doBValue,
              onPressed: () {},
            ),

            const SizedBox(
              height: Sizes.spaceBetween,
            ),
            // SizedBox(
            //   width: double.infinity,
            // child:
            Center(
                child: TextButton(
                    onPressed: () {
                      controller.deleteWarningPopUp();
                    },
                    child: Text(
                      TxtContents.closeAccTxt,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 13, color: Colors.red),
                    )))
            // )
          ],
        ),
      )),
    );
  }
}
