import 'package:flutter/material.dart';
import 'package:ymk_store/features/shop/models/cartItemModel.dart';

import '../../../../../common/widgets/customShapes/containers/circularImage.dart';
import '../../../../../common/widgets/products/brandNameWithVerify.dart';
import '../../../../../common/widgets/text/productTitleText.dart';
import '../../../../../utils/constants/txtContents.dart';
import '../../../../../utils/constants/assetImage.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:14.0,right: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CircularImage(
              height: 60,
              width: 60,
              padding: 0,
              image: cartItem.image ?? '',
              isNetworkImage: true,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandNameWithVerify(brandName: cartItem.brandName ?? ''),
              const SizedBox(
                height: Sizes.sm / 2 - 1,
              ),
              ProductTitleTxt(
                productTitle: cartItem.title,
                maxLines: 1,
              ),
              Text.rich(TextSpan(
                children: (cartItem.selectedVariation ?? {})
                    .entries
                    .map((e) => TextSpan(children: [
                          TextSpan(
                              text: ' ${e.key}',
                              style: Theme.of(context).textTheme.labelLarge),
                          TextSpan(
                              text: " ${e.value}",
                              style: Theme.of(context).textTheme.labelMedium),
                        ]))
                    .toList(),
              ))
            ],
          ),
        )
      ],
    );
  }
}
