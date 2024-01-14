import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class BillAddressSection extends StatelessWidget {
  const BillAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: TxtContents.shippingAddressTxt,
          btnTitle: TxtContents.changeTxt,
          showActionBtn: true,
          onPressed: () {},
        ),
        Text(
          TxtContents.accountName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: Sizes.spaceBetween ),
        Row(
          children:  [
           const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: Sizes.spaceBetween,
            ),
            Text("+959-442322112",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: Sizes.spaceBetween/2,),
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
            Flexible(child: Text(TxtContents.addressDetails,style: Theme.of(context).textTheme.bodyMedium,))
          ],
        )
      ],
    );
  }



}


