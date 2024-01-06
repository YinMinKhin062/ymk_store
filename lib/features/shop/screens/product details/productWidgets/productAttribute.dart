import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/headerSection.dart';
import '../../../../../utils/theme/custom_themes/sizes.dart';
import 'myRawChip.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Sizes.spaceBetween / 1.5,
        ),

        //variation box
        // CircularContainer(
        //   height: 110,
        //   radius: 20,
        //   bgColor: Colors.white,
        //   showBorder: true,
        //   child: Padding(
        //     padding: const EdgeInsets.all(Sizes.md),
        //     child: Column(
        //       children: [
        //         const HeaderSection(title: "Variation", btnTitle: ""),
        //         const SizedBox(
        //           height: Sizes.spaceBetween / 1.5,
        //         ),
        //         Row(
        //           children: [
        //             //price variation

        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   children: [
        //                     const ProductTitleTxt(
        //                       productTitle: "Price",
        //                       txtSize: TextSizes.small,
        //                     ),
        //                     const SizedBox(
        //                       width: Sizes.spaceBetween,
        //                     ),
        //                     Text(
        //                       "Ks 260000",
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .labelLarge!
        //                           .apply(
        //                               decoration: TextDecoration.lineThrough),
        //                     ),
        //                     const SizedBox(
        //                       width: Sizes.spaceBetween,
        //                     ),
        //                     Text("Ks 195000",
        //                         style: Theme.of(context)
        //                             .textTheme
        //                             .labelLarge!
        //                             .copyWith(fontWeight: FontWeight.bold)),
        //                   ],
        //                 ),

        //                 SizedBox(
        //                   height: Sizes.sm,
        //                 ),

        //                 //stock variation
        //                 Row(
        //                   children: [
        //                     const ProductTitleTxt(
        //                       productTitle: TxtContents.statusTitle,
        //                       txtSize: TextSizes.small,
        //                     ),
        //                     const SizedBox(
        //                       width: Sizes.spaceBetween,
        //                     ),
        //                     Text(
        //                       TxtContents.statusValueTxt,
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .labelLarge!
        //                           .copyWith(fontWeight: FontWeight.bold),
        //                     )
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        // const SizedBox(
        //   height: Sizes.spaceBetween,
        // ),

        //attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(title: "Colors", btnTitle: ""),
            const SizedBox(
              height: Sizes.spaceBetween / 2,
            ),
            Wrap(
              spacing: 8,
              children:const [
                MyRawChip(
                  text: 'Pink',
                  isSelected: false,
                  
                ),
                MyRawChip(
                  text: 'White',
                  isSelected: true,
                ),
                MyRawChip(
                  text: 'Blue',
                  isSelected: false,
                ),
                MyRawChip(
                  text: 'Green',
                  isSelected: false,
                ),
                MyRawChip(
                  text: 'Black',
                  isSelected: false,
                ),
              ],
            )
          ],
        ),

        //size
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const HeaderSection(title: "Size", btnTitle: ""),
        //     const SizedBox(
        //       height: Sizes.spaceBetween / 2,
        //     ),
        //     Wrap(
        //       spacing: 8,
        //       children: const [
        //         MyRawChip(
        //           text: 'Ivory White',
        //           isSelected: true,
        //         ),
        //         MyRawChip(
        //           text: 'Black',
        //           isSelected: true,
        //         ),
        //       ],
        //     )
        //   ],
        // ),
      ],
    );
  }
}
