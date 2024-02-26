import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymk_store/features/personalization/controllers/userController.dart';
import 'package:ymk_store/features/personalization/screens/cart/cart.dart';

import 'appbar.dart';
import 'shoppingCartWidget.dart';

class HomeAppBar extends StatelessWidget {
  final String? title, subtitle;
  final Color color;
  final CallbackAction? onPressed;

  const HomeAppBar(
      {super.key,
      this.title,
      this.subtitle,
      required this.color,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle!,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: color.withOpacity(.5))),
          Obx(
            () => Text(
              controller.user.value.userName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: color),
            ),
          ),
        ],
      ),
      actions: [
        ShoppingCartWidget(
          iconColor: color,
        ),
      ],
    );
  }
}
