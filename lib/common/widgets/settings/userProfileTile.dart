import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';

import '../../../utils/constants/txtContents.dart';
import '../../../utils/constants/assetImage.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularContainer(
        width: 55,
        height: 55,
        bgColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(assetImage.user3),
            radius: 40,
          ),
        ),
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
        style:
            Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit),
        color: Colors.white,
      ),
    );
  }
}
