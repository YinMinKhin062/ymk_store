import 'package:flutter/material.dart';
import 'package:ymk_store/utils/constants/enum.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/priceCalculator.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';
import '../../../../shop/controlllers/cartController.dart';

class BillAmountSection extends StatelessWidget {
  const BillAmountSection({super.key});

  @override
  Widget build(BuildContext context) {

    final controller=CartController.instance;
    final subtotal=controller.totalCartPrice.value;
    final totalPrice=PriceCalculator.calculateTotalPrice(subtotal,"ShippingTownships.yangon").toStringAsFixed(2);
    final shippingfee= PriceCalculator.shippingFeeCalculator("ShippingTownships.yangon");
    return Column(
      
      children: [
        //subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.subtotalTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$ ${subtotal}",style: Theme.of(context).textTheme.bodyMedium,),
            
          ],
        ),
        const SizedBox(height: Sizes.spaceBetween/2,),
        //shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.shppingFeeTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$ $shippingfee",style: Theme.of(context).textTheme.labelMedium,),
            
          ],
        ),
        const SizedBox(height: Sizes.spaceBetween/2,),
        //tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.TaxFeeTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$ ${PriceCalculator.getTaxAmount(subtotal).toStringAsFixed(2)}",style: Theme.of(context).textTheme.labelMedium,),
            
          ],
        ),
        const SizedBox(height: Sizes.spaceBetween/2,),
        //order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtContents.orderTotalTxt,style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$ ${PriceCalculator.calculateTotalPrice(subtotal,"ShippingTownships.yangon").toStringAsFixed(2)}",style: Theme.of(context).textTheme.titleMedium,),
            
          ],
        ),
        
      ],
    );
  }
}