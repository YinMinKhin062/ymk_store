import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CircularIcon extends StatelessWidget {
  final Color? color, iconColor;
  final double? size;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool showBorder;
  final Color borderColor;
  final double? width, height;
  final BoxShadow? boxShadow;
  final bool showBoxShadow;
  // final BoxBorder border;
   CircularIcon({
    super.key,
    this.color,
    this.iconColor,
    this.size,
    required this.icon,
    this.onPressed,
    this.showBorder = true,
    this.borderColor = Colors.transparent,
    this.boxShadow,
    this.showBoxShadow = false,
    this.width = 42,
    this.height = 42,
  });

  @override
  // bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          // color: Colors.black.withOpacity(.06),
          color: color,
          border:
              // showBorder ? Border.all(color: borderColor) : null,
             Border.all(color: borderColor) ,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(.3),
          //     blurRadius: 5,
          //     spreadRadius: 2,
          //     offset: const Offset(2, 0),
          //   ),
          //   const BoxShadow(
          //     color: Colors.white,
          //     offset: Offset(0.0, 0.0),
          //     blurRadius: 0.0,
          //     spreadRadius: 0.0,
          //   ),
          // ]
          ),
      child: Center(
        child: IconButton(
          //   onPressed: () {
          //   setState(() {
          //     isFavourite=!isFavourite;
          //   });

          // }
          onPressed: onPressed,
          icon:
              //  Center(
              //   child:
              Icon(
            icon,
            color: iconColor,
            size: size,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 50,
                offset: const Offset(0, 2),
              )
            ],
          ),
          // )
        ),
      ),
    );
  }
}
