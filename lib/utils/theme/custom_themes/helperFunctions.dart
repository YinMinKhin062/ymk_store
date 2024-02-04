import 'package:flutter/material.dart';

class MyHelperFunctions {
  static Color? getColor(String text) {
    if (text == "Green") {
      return Colors.green;
    } else if (text == "Blue") {
      return Colors.blue;
    } else if (text == "Red") {
      return Colors.red;
    } else if (text == "Orange") {
      return Colors.orange;
    } else if (text == "Pink") {
      return Colors.pink;
    } else if (text == "Black") {
      return Colors.black;
    } else if (text == "White") {
      return Colors.white;
    } else if (text == "Violet" || text=="Purple") {
      return Colors.deepPurple;
    } else if (text == "Grey") {
      return Colors.grey;
    } else if (text == "Yellow") {
      return Colors.yellow;
    }else if(text=="Silver"){
        return Colors.grey.withOpacity(.2);
    } 
    else {
      return null;
    }
  }
}
