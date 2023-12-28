import 'package:flutter/material.dart';

class TextBtnTheme{
  TextBtnTheme._(); // ElevatedBtnTheme instance=ElevatedBtnTheme();

  static final lightTxtBtn= TextButtonThemeData(
    style: ElevatedButton.styleFrom(
     elevation: 0,
      // foregroundColor: Colors.grey,
    )
  );

  //dart theme elevated btn
   static final darkTxtBtn= TextButtonThemeData(
    style: ElevatedButton.styleFrom(
 
  
    )
  );
}