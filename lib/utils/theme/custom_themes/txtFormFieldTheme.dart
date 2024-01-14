import 'package:flutter/material.dart';

import 'sizes.dart';

class TxtFormFieldTheme {
  TxtFormFieldTheme._();
  static InputDecorationTheme inputformDecoration = InputDecorationTheme(
    contentPadding: const EdgeInsets.all(12),
    isDense: true,
    errorMaxLines: 3,
    
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle:const TextStyle().copyWith(color: Colors.black,),
    hintStyle:const TextStyle().copyWith(color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    alignLabelWithHint: true,

    // floatingLabelAlignment: FloatingLabelAlignment.start,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.inputFieldRadius)),
    ),
    errorBorder:const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.inputFieldRadius)),
    ),
    focusedBorder:const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.inputFieldRadius)),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.inputFieldRadius)),
    ),
    disabledBorder:const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.inputFieldRadius)),
    ),
  );
}
