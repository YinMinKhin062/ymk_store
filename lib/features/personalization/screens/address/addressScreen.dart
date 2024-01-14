import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/personalization/screens/address/addNewAddress.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

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
    // GetCoordinates c = GetCoordinates();
    String? address;
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

          Get.to(() => const AddNewAddress(
              ));
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
          child: Column(
            children: const [
              SingleAddress(
                selectedAddress: false,
              ),
              SizedBox(
                height: Sizes.md,
              ),
              SingleAddress(
                selectedAddress: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
