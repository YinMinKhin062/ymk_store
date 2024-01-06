import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/features/personalization/screens/profile/profile.dart';

import '../../../utils/constants/txtContents.dart';
import '../../../utils/constants/assetImage.dart';
import '../personalWidgets/profileImage.dart';

class UserProfileTile extends StatelessWidget {
  final VoidCallback? onPressed;
  const UserProfileTile({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const Profile()),
      child: ListTile(
        leading: const ProfileImage(
          imageName: assetImage.user3,
        ),
        title: Text(
          TxtContents.accountName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.white),
        ),
        subtitle: Text(
          TxtContents.accountEmail,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: Colors.white),
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
