import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/features/personalization/models/addressModel.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../controllers/addressController.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress(
      {super.key,
      // required this.selectedAddress,
      required this.address,
      this.onTap});
  // final bool selectedAddress;

  final AddressModel address;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Obx(() {
      final selectedAddressId=controller.selectedAddress.value.id;
      final selectedAddress= selectedAddressId==address.id;
      return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(bottom: Sizes.spaceBetween),
          child: CircularContainer(
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
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
        
                  const SizedBox(height: Sizes.sm / 2),
        
                  //phone no
                  Text(
                    address.phoneno,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
        
                  const SizedBox(height: Sizes.sm / 2),
        
                  //address
                  if(address.currentLocation!=null)
                  Text(
                    address.currentLocation ?? address.houseno,
                    softWrap:
                        true, // can break text to the next line by setting the softWrap property of the Text widget to true
                    style: Theme.of(context).textTheme.labelLarge,
                  ),

                   const SizedBox(height: Sizes.sm / 2),

                  // //address
                  // Text(
                  //   address.houseno,
                  //   softWrap:
                  //       true, // can break text to the next line by setting the softWrap property of the Text widget to true
                  //   style: Theme.of(context).textTheme.labelLarge,
                  // ),
                 
                ],
              )
            ]),
          ),
        ),
      );
    });
  }
}
