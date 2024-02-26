import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../controllers/addressController.dart';

class BillAddressSection extends StatelessWidget {
  const BillAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(
            title: TxtContents.shippingAddressTxt,
            btnTitle: TxtContents.changeTxt,
            showActionBtn: true,
            onPressed: () {
              controller.selectNewAddressPopUp(context);
            },
          ),
          controller.selectedAddress.value.id.isNotEmpty?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.selectedAddress.value.name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight:FontWeight.w500),
              ),
              const SizedBox(height: Sizes.spaceBetween-4),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: Sizes.spaceBetween,
                  ),
                  Text(
                    controller.selectedAddress.value.phoneno,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              const SizedBox(
                height: Sizes.spaceBetween / 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_history,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: Sizes.spaceBetween,
                  ),
                  Flexible(
                      child: Text(
                    controller.selectedAddress.value.currentLocation ??
                        controller.selectedAddress.value.houseno,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
                ],
              )
            ],
          ):Text('Select Address',style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
