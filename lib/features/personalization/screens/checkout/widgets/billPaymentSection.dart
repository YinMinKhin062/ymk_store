import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../../common/widgets/text/headerSection.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class BillPaymentSection extends StatelessWidget {
  const BillPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(
          title: TxtContents.paymentMethodTxt,
          btnTitle: TxtContents.changeTxt,
          showActionBtn: true,
          onPressed: () {},
        ),
        Row(
          children:  [
           const CircularContainer(
              width: 60,
              height: 35,
              padding: EdgeInsets.all(Sizes.sm),
              child:Image(image: NetworkImage(assetImage.paypalImg)) ,
            ),
            const SizedBox(width: Sizes.spaceBetween/2,),
            Text("Paypal",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        )
      ],
    );
  }
}
