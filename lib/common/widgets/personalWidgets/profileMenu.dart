import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class ProfileMenu extends StatelessWidget {
  final String nameTitle, nameValue;
  final VoidCallback? onPressed;
  final IconData ?icon;

  const ProfileMenu(
      {super.key,
      required this.nameTitle,
      required this.nameValue,
      this.onPressed,
      this.icon = Iconsax.arrow_right_34});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.spaceBetween/1.5),
        child: Row(
          children: [
           
            Expanded(
                flex: 4,
                child: Text(
                  nameTitle,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  nameValue,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                )),
             Expanded(
              child: Icon(
                icon,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
