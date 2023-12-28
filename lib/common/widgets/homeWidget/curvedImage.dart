
import 'package:flutter/material.dart';


class CurvedImage extends StatelessWidget {
  final double imgBorderRadius;
  // final EdgeInsets imgPadding;
  final double? width, height;
  final bool isNetworkImg;
  final String imgPath;
  final VoidCallback? onTap;

  const CurvedImage({
    super.key,
    required this.imgBorderRadius,
    required this.isNetworkImg,
    required this.imgPath,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(imgBorderRadius),
          border: Border.all(color: Colors.grey.withOpacity(.1)),
         
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(imgBorderRadius),
          child: Image(
           
            image: isNetworkImg
                ? NetworkImage(imgPath)
                : AssetImage(imgPath) as ImageProvider,
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
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
