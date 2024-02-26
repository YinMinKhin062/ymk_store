import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/customShapes/containers/circularContainer.dart';
import 'package:ymk_store/features/personalization/controllers/orderController.dart';
import 'package:ymk_store/navigationMenu.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/enum.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';
import 'package:ymk_store/utils/popup/animationLoaderWidget.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    if (kDebugMode) {
      // print("order results=  ${controller.fetchUserOrders()}");
    }
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyWidget = AnimationLoaderWidget(
            animation: assetImage.noWishlist,
            text: 'Whoops!. No Orders Yet!',
            showAction: true,
            actionText: "Let's order",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          final res = CloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (res != null) return res;

          final orders = snapshot.data!;

          if (kDebugMode) {
            print("orders are $orders,${orders.length}");
          }

          return ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (_, index) => const SizedBox(
              height: Sizes.spaceBetween,
            ),
            itemBuilder: (_, index) {
              final order = orders[index];

              if (kDebugMode) {
                print(orders);
                print(orders[index].orderDate);
              }
              return CircularContainer(
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
                                order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: Colors.deepPurple,
                                        fontWeightDelta: 1),
                              ),
                              Text(
                               order.formattedOrderDate,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.id,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.formattedShippedDate,
                                      // "Hello2",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
              );
            },
          );
        });
  }
}
