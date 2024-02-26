import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/features/shop/controlllers/checkoutController.dart';
import 'package:ymk_store/features/shop/models/paymentMethodModel.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentmethod.value=paymentMethod;
        Get.back();
      },
      leading: CircularContainer(
        width: 55,
        height: 35,
        bgColor: Colors.white,
        padding: const EdgeInsets.all(Sizes.sm),
        child: Image(
          image: NetworkImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name,style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 13)),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
