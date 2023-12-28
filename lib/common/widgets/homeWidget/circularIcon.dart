import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CircularIcon extends StatefulWidget {
  final Color ?color;
  final double? size;
  final IconData icon;
  final VoidCallback? onPressed;
  const CircularIcon({super.key,this.color,this.size,required this.icon,this.onPressed});

  @override
  State<CircularIcon> createState() => _CircularIconState();
}

class _CircularIconState extends State<CircularIcon> {
  @override
  bool isFavourite=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white.withOpacity(.2),
      ),
      child: IconButton(
      //   onPressed: () {
      //   setState(() {
      //     isFavourite=!isFavourite;
      //   });
       
      // }
      onPressed: widget.onPressed,
       icon: Icon(
        isFavourite ? Iconsax.heart5 : widget.icon,
      color:isFavourite? Colors.red : widget.color,
      size: widget.size,)),
    );
  }
}
