import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/personalization/screens/profile/profile.dart';

import '../../../features/personalization/controllers/userController.dart';
import '../../../utils/constants/assetImage.dart';
import '../personalWidgets/profileImage.dart';

class UserProfileTile extends StatelessWidget {
  final VoidCallback? onPressed;
  const UserProfileTile({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return GestureDetector(
      onTap: () => Get.to(const Profile()),
      child: ListTile(
        leading: Obx(() {
          final networkImg = controller.user.value.profilepic;
          final image = networkImg!.isNotEmpty ? networkImg : assetImage.user3;
          return ProfileImage(
            imageName: image,
          );
        }),
        title: Obx(
          () => Text(
            controller.user.value.userName,
            // TxtContents.accountName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.white),
          ),
        ),
        subtitle: Obx(
          () => Text(
            // TxtContents.accountEmail,
            controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.white),
          ),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit),
          color: Colors.white,
        ),
      ),
    );
  }
}
