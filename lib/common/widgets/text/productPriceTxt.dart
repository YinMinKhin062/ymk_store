import 'package:flutter/material.dart';

class ProductPriceTxt extends StatelessWidget {
  const ProductPriceTxt(
      {super.key,
      required this.currency,
      required this.price,
      this.isLarge = false,
      this.islineThrough = false,this.color=Colors.black});
  final bool islineThrough;
  final String currency, price;
  final bool isLarge;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$currency $price",
      // NumberFormat.currency(decimalDigits: 0).format(price),
      // style: Theme.of(context).textTheme.bodyMedium,
      style: isLarge
          ? Theme.of(context).textTheme.headlineSmall!.apply(
              color: color,
              fontSizeFactor: 1.1,
              decoration: islineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.bodyMedium!.apply(
              color: color,
              fontWeightDelta: 2,
              decoration: islineThrough ? TextDecoration.lineThrough : null),

      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
