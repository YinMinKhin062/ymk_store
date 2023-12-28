import 'package:flutter/material.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout(
      {super.key,
      required this.itemCount,
      required this.mainAxisExtent,
      required this.itemBuilder});
  final int itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //no of items in each row
          mainAxisSpacing: Sizes.gridViewSpace, //row spacing
          crossAxisSpacing: Sizes.gridViewSpace, //column spacing
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
