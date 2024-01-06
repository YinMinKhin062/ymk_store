import 'package:flutter/material.dart';

import '../customShapes/containers/circularContainer.dart';

class ProfileImage extends StatelessWidget {
  final String imageName;
  final double width, height;
  final double padding;
  final Color bgColor;
  const ProfileImage(
      {super.key,
      required this.imageName,
      this.width = 55,
      this.height = 55,
      this.bgColor = Colors.white,this.padding=2.0});

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      width: width,
      height: height,
      bgColor: bgColor,
      child: Padding(
        padding:  EdgeInsets.all(padding),
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageName),
          radius: 40,
        ),
      ),
    );
  }
}
