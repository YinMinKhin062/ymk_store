import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final double? width,height;
  final EdgeInsets ? margin;
  final EdgeInsets ?padding;
  final double radius;
  final Color bgColor;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final List<BoxShadow>? boxShadow;
  final AlignmentGeometry? alignment;
  const CircularContainer(
      {super.key,
      this.width,
      this.height,
      this.alignment,
      this.showBorder=false,
      this.padding ,
      this.margin,
      this.radius = 400,
      this.bgColor=Colors.transparent,
      this.boxShadow,
      this.borderColor=Colors.grey,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:padding,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border:showBorder? Border.all(color:borderColor,width: .2):null,
        color: bgColor,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
