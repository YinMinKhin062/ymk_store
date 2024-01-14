import 'package:flutter/material.dart';

import '../../../../../common/widgets/customShapes/containers/circularImage.dart';
import '../../../../../common/widgets/products/brandNameWithVerify.dart';
import '../../../../../common/widgets/text/productTitleText.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/constants/assetImage.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircularImage(
          height: 60,
          width: 60,
          padding: 0,
          image: assetImage.productMiPhone,
          isNetworkImage: true,
        ),
        Expanded(
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandNameWithVerify(brandName: TxtContents.brandMi),
            
               const ProductTitleTxt(
                  productTitle: TxtContents.productOvenTxt,
                  maxLines: 1,
                ),
              
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "${TxtContents.colorTxt} ",
                    style: Theme.of(context).textTheme.labelLarge),
                TextSpan(
                    text: "Green",
                    style: Theme.of(context).textTheme.labelMedium),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
