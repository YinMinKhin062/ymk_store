import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (context, index) =>const SizedBox(
        height: Sizes.spaceBetween,
      ),
      itemBuilder: (context, index) => CircularContainer(
        showBorder: true,
        bgColor: Colors.grey.withOpacity(.1),
        padding: const EdgeInsets.all(Sizes.spaceBetween),
        radius: Sizes.md,
        child: Column(
          children: [
            //row 1
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: Sizes.sm,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: Colors.deepPurple, fontWeightDelta: 1),
                      ),
                      Text(
                        "01 Jan 2024",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_3,
                      size: 16,
                    ))
              ],
            ),
            const SizedBox(
              height: Sizes.spaceBetween / 2,
            ),

            //row2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: Sizes.sm,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "#83793",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: Sizes.sm,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "25 Jan 2024",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
