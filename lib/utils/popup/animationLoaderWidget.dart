import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

import '../theme/custom_themes/sizes.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget(
      {super.key,
      required this.animation,
      required this.text,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String animation;
  final String text;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(animation,
            width: MediaQuery.of(context).size.width * .8), //display animation
        const SizedBox(
          height: Sizes.defaultSpace,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.defaultSpace,
        ),
        showAction
            ? SizedBox(
              width: 250,
              child: OutlinedButton(
                  onPressed: onActionPressed,
                  child: Text(
                    actionText!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            )
            : const SizedBox(),
      ],
    );
  }
}
