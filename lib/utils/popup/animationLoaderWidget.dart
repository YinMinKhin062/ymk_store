import 'package:flutter/material.dart';

import '../theme/custom_themes/sizes.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget(
      {super.key,
      required this.animation,
      required this.text,
      this.showAction = false,
      this.actionText,
      this.onActionPressed,
      this.width=60,
      this.height=60});

  final String animation;
  final String text;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;
  final  double width,height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.md),
          child:  Image(
            image: AssetImage(animation),
            width: width,
            height: height,
          ),
        ),
        // Image.asset(
        //   assetImage.loadingImg
        // ),
        // Expanded(
        //   child: Lottie.asset(assetImage.loadingImg,
        //       width: MediaQuery.of(context).size.width * .8),
        // ), //display animation
        // const SizedBox(
        //   height: Sizes.defaultSpace,
        // ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
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
