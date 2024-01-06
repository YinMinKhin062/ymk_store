import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CircularIcon extends StatefulWidget {
  final Color? color,iconColor;
  final double? size;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool showBorder;
  final double ?width,height;
  // final BoxBorder border;
  const CircularIcon({
    super.key,
    this.color,
    this.iconColor,
    this.size,
    required this.icon,
    this.onPressed,
    this.showBorder=true,
    this.width=42,
    this.height=42,
  });

  @override
  State<CircularIcon> createState() => _CircularIconState();
}

class _CircularIconState extends State<CircularIcon> {
  @override
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // color: Colors.black.withOpacity(.06),
        color: widget.color,
        border: widget.showBorder ? Border.all(color: Colors.grey.withOpacity(.1)):null,
        // shape: BoxShape.circle,
        // boxShadow:[
        //   BoxShadow(
        //       color: Colors.grey.withOpacity(.4),
        //       blurRadius: 10,
        //       spreadRadius: 4,
        //       offset: Offset(0, 2)
        //   )
        // ]
      ),
      child: Center(
        child: IconButton(
            //   onPressed: () {
            //   setState(() {
            //     isFavourite=!isFavourite;
            //   });
      
            // }
            onPressed: widget.onPressed,
            icon:
            //  Center(
            //   child: 
              Icon(
                isFavourite ? Iconsax.heart5 : widget.icon,
                color:  widget.iconColor,
                size: widget.size,
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
