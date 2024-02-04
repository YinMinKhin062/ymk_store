import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmerEffect extends StatelessWidget {
  const MyShimmerEffect(
      {super.key, required this.width, required this.height, this.radius = 15});

  final double radius;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(.4),
      highlightColor: Colors.black.withOpacity(.3),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
