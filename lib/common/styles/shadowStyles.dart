import 'package:flutter/material.dart';

class ShadowStyle{
  static final verticalProductShadow=BoxShadow(
    color: Colors.grey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset:const Offset(0, 2),
  );
  static final horizontalProductShadwo=BoxShadow(
    color: Colors.grey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset:const Offset(0, 2),
  );
}