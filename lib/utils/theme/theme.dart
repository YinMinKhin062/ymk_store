import 'package:flutter/material.dart';
import 'package:ymk_store/utils/theme/custom_themes/appBarTheme.dart';
import 'package:ymk_store/utils/theme/custom_themes/bottomSheetTheme.dart';
import 'package:ymk_store/utils/theme/custom_themes/elevatedBtnTheme.dart';
import 'package:ymk_store/utils/theme/custom_themes/textBtnTheme.dart';
import 'package:ymk_store/utils/theme/custom_themes/txtFormFieldTheme.dart';

import 'custom_themes/texttheme.dart';
import 'outlineBtnTheme.dart';

class AppTheme{
  AppTheme._();
  // AppTheme instance=AppTheme();
static  ThemeData lightTheme=ThemeData(
  useMaterial3: true,
  fontFamily:'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TxtTheme.lightTextTheme,
  appBarTheme:appBarTheme.lightAppBar,
  bottomSheetTheme: customBottomSheetTheme.lightBottomSheetTheme,
  elevatedButtonTheme: ElevatedBtnTheme.lightEleBtn,
  outlinedButtonTheme: OutlineBtnTheme.outlinebtn,
  textButtonTheme: TextBtnTheme.lightTxtBtn,
  inputDecorationTheme: TxtFormFieldTheme.inputformDecoration,

);
static  ThemeData darkTheme=ThemeData(
  useMaterial3: true,
  fontFamily:'Poppins',
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TxtTheme.darkTextTheme,
  appBarTheme:appBarTheme.darkAppBar,
  bottomSheetTheme: customBottomSheetTheme.darkBottomSheetTheme,
  elevatedButtonTheme: ElevatedBtnTheme.darlEleBtn,
  textButtonTheme: TextBtnTheme.darkTxtBtn,

);
}