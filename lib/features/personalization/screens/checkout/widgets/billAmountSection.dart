import 'package:flutter/material.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/priceCalculator.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class BillAmountSection extends StatelessWidget {
  const BillAmountSection({super.key});

  @override
  Widget build(BuildContext context) {

   
    return Column(
      
      children: [
        //subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.subtotalTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("Ks 4,000,000",style: Theme.of(context).textTheme.bodyMedium,),
            
          ],
        ),
        const SizedBox(height: Sizes.spaceBetween/2,),
        //shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.shppingFeeTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("Ks ${PriceCalculator.shippingFeeCalculator("ShippingTownships.yangon")}",style: Theme.of(context).textTheme.labelMedium,),
            
          ],
        ),
        const SizedBox(height: Sizes.spaceBetween/2,),
        //tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.TaxFeeTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("Ks ${PriceCalculator.getTaxAmount(400000)}",style: Theme.of(context).textTheme.labelMedium,),
            
          ],
        ),
        const SizedBox(height: Sizes.spaceBetween/2,),
        //order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.orderTotalTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("Ks ${PriceCalculator.calculateTotalPrice(400000,"ShippingTownships.yangon")}",style: Theme.of(context).textTheme.titleMedium,),
            
          ],
        ),
        
      ],
    );
  }
}