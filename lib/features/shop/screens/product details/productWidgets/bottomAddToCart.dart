import 'package:flutter/material.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.child,this.height=82});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.defaultSpace, vertical: Sizes.defaultSpace / 2),
      decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(.1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(7, 0),
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Sizes.cardRadiusLg),
            topRight: Radius.circular(Sizes.cardRadiusLg),
          )),
      child: child,
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     //
      //     Row(
      //       children: [
      //         CircularIcon(
      //           icon: Iconsax.minus,
      //           color: Colors.grey,
      //           iconColor: Colors.white,
      //           onPressed: () {},
      //         ),
      //         const SizedBox(
      //           width: Sizes.spaceBetween,
      //         ),
      //         const Text("2"),
      //         const SizedBox(
      //           width: Sizes.spaceBetween,
      //         ),
      //         CircularIcon(
      //           icon: Iconsax.add,
      //           color: Colors.black,
      //           iconColor: Colors.white,
      //           onPressed: () {},
      //         ),
      //       ],
      //     ),

      //     ElevatedButton(
      //       onPressed: () {},
      //       style: ElevatedButton.styleFrom(
      //           padding: const EdgeInsets.all(
      //             Sizes.md,
      //           ),
      //           backgroundColor: Colors.black,
      //           side: const BorderSide(color: Colors.black)),
      //       child: const Text(TxtContents.addToCartTxt),
      //     ),
      //   ],
      // ),
    );
  }
}
