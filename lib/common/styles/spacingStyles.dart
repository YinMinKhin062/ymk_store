import 'package:flutter/material.dart';

import '../../utils/theme/custom_themes/sizes.dart';

class SpacingStyles{
  static const EdgeInsetsGeometry paddingWithAppBarHeight=EdgeInsets.only(
    top:Sizes.appBarHeight,
    left: Sizes.defaultSpace,
    bottom: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingWithDoubleAppBarHeight=EdgeInsets.only(
    top:Sizes.appBarHeight*1.2,
    left: Sizes.defaultSpace,
    bottom: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
  );
}