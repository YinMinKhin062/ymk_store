import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ShoppingCartWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color iconColor;
  const ShoppingCartWidget({super.key,required this.onPressed,required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return  Stack(
                          children: [
                            IconButton(
                                onPressed: onPressed,
                                icon:  Icon(
                                  Iconsax.shopping_bag,
                                  color: iconColor,
                                )),
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  "1",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        );
  }
}