import 'package:flutter/material.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class CurvedImage extends StatelessWidget {
  final double imgBorderRadius;
  // final EdgeInsets imgPadding;
  final double? width, height;
  final bool isNetworkImg;
  final Color? bgColor;
  final String imgPath;
  final VoidCallback? onTap;
  final BoxFit fit;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  // final bool showBorder;

  const CurvedImage({
    super.key,
    this.imgBorderRadius = Sizes.md,
    required this.isNetworkImg,
    required this.imgPath,
    this.onTap,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.bgColor,
    // this.showBorder=false,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(imgBorderRadius),
          // border: showBorder? Border.all(color: Colors.grey.withOpacity(.1)):null,
          border: border,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(imgBorderRadius),
          child: Image(
            image: isNetworkImg
                ? NetworkImage(imgPath)
                : AssetImage(imgPath) as ImageProvider,
            alignment: Alignment.bottomCenter,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator()));
              }
            },
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.wifi_off_outlined),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
