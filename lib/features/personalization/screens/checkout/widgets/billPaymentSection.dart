import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/features/shop/controlllers/checkoutController.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../../common/widgets/text/headerSection.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class BillPaymentSection extends StatelessWidget {
  const BillPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Column(
      children: [
        HeaderSection(
          title: TxtContents.paymentMethodTxt,
          btnTitle: TxtContents.changeTxt,
          showActionBtn: true,
          onPressed: () => controller.selectPaymentmethod(context),
        ),
        Obx(
          ()=> Row(
            children: [
               CircularContainer(
                width: 60,
                height: 40,
                padding: const EdgeInsets.all(Sizes.sm),
                bgColor: Colors.white,
                child: Image(image: NetworkImage(controller.selectedPaymentmethod.value.image),fit: BoxFit.contain,),
              ),
              const SizedBox(
                width: Sizes.spaceBetween / 2,
              ),
              Text(
                controller.selectedPaymentmethod.value.name,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        )
      ],
    );
  }
}
