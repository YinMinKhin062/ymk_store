import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      width: double.infinity,
      radius: Sizes.md,
      padding: const EdgeInsets.all(Sizes.md),
      bgColor: selectedAddress
          ? Colors.deepPurpleAccent.withOpacity(.3)
          : Colors.transparent,
      showBorder: true,
      borderColor: selectedAddress ? Colors.transparent : Colors.grey,
      child: Stack(children: [
        Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name
            Text(
              TxtContents.accountName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              // style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: Sizes.sm / 2),

            //phone no
            Text(
              TxtContents.phonenoValue,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge,
            ),

            const SizedBox(height: Sizes.sm / 2),

            //address

            Text(
              TxtContents.addressDetails,
              softWrap:
                  true, // can break text to the next line by setting the softWrap property of the Text widget to true
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        )
      ]),
    );
  }
}
