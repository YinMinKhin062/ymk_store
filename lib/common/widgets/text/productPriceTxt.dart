import 'package:flutter/material.dart';

class ProductPriceTxt extends StatelessWidget {
  const ProductPriceTxt(
      {super.key,
      required this.currency,
      required this.price,
      this.islineThrough = false});
  final bool islineThrough;
  final String currency, price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$currency $price",
      // NumberFormat.currency(decimalDigits: 0).format(price),
      // style: Theme.of(context).textTheme.bodyMedium,
      style:  Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(decoration: islineThrough ? TextDecoration.lineThrough:null),
          
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
