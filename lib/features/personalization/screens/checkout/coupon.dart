import 'package:flutter/material.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../common/widgets/customShapes/containers/circularContainer.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(
        title: Text(TxtContents.couponTxt),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            CircularContainer(
              bgColor: Colors.grey.withOpacity(.1),
              showBorder: true,
              radius: Sizes.sm,
              padding: const EdgeInsets.only(
                  top: Sizes.sm/2,
                  bottom: Sizes.sm/2,
                  left: Sizes.md/2,
                  right: Sizes.sm/2),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: TxtContents.haveCouponTxt,
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBetweenSections-4,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: const Text("Apply")),
            )
          ],
        ),
      ),
    );
  }
}
