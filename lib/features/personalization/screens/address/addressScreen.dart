import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/personalization/controllers/addressController.dart';
import 'package:ymk_store/features/personalization/screens/address/addNewAddress.dart';
import 'package:ymk_store/utils/Loading/myShimmerEffet.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import 'singleAddress.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    // GetCoordinates c = GetCoordinates();
   
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // c.getCurrentAddress().then((value) {
          //   if (!value.isEmpty) {
          //     setState(() {
          //       address = value;
          //     });
          //   }
          // });

          Get.to(() => const AddNewAddress());
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          TxtContents.addressAppBarTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.fetchAddreses(),
                builder: (_, snapshot) {
                  final res = CloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                  );

                  if (res != null) return res;

                  final addresses = snapshot.data!;
                  if (kDebugMode) {
                    print(addresses);
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => SingleAddress(
                      address: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
