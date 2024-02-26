import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/theme/custom_themes/sizes.dart';

import '../../personalization/screens/checkout/widgets/paymentTile.dart';
import '../models/paymentMethodModel.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  Rx<PaymentMethodModel> selectedPaymentmethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedPaymentmethod.value =
        PaymentMethodModel(name: 'Paypal', image: assetImage.paypalImg);
  }

  Future<dynamic> selectPaymentmethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.spaceBetweenSections-3),
              child: Column(
                children: [
                  const HeaderSection(
                    title: "Select Payment Method",
                    btnTitle: "",
                    showActionBtn: false,
                  ),
                  const SizedBox(
                    height: Sizes.spaceBetween,
                  ),
                  PaymentTile(
                    paymentMethod: PaymentMethodModel(
                        name: 'Paypal', image: assetImage.paypalImg),
                  ),
                  const SizedBox(height: Sizes.spaceBetween/3,),
                  PaymentTile(
                    paymentMethod: PaymentMethodModel(
                        name: 'Visa', image: assetImage.visaImg),
                  ),
                  const SizedBox(height: Sizes.spaceBetween/3,),
                  PaymentTile(
                    paymentMethod: PaymentMethodModel(
                        name: 'Master', image: assetImage.masterImg),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
