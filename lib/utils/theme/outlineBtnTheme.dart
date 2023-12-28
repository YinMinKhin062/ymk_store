import 'package:flutter/material.dart';

class OutlineBtnTheme{
  OutlineBtnTheme._();
  static final outlinebtn=OutlinedButtonThemeData(
    style:OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 18),
    )
  );
}