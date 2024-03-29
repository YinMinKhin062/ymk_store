import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircularImage extends StatelessWidget {
  final double width, height, padding;
  final bool isNetworkImage;
  final BoxFit fit;
  // final Color? bgColor;
  final String image;

  const CircularImage(
      {super.key,
      required this.height,
      required this.width,
      required this.padding,
      required this.image,
      this.isNetworkImage = false,

      // this.bgColor,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        // color: Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        // child: Image(
        //   image: isNetworkImage
        //       ? NetworkImage(image)
        //       : AssetImage(image) as ImageProvider,
        //   fit: fit,
        // ),
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                progressIndicatorBuilder: (context, url, progress) =>
                    CircularProgressIndicator(
                  value: progress.progress,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Image(image: AssetImage(image) as ImageProvider),
      ),
    );
  }
}
