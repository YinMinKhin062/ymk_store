import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/validators/validation.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../controllers/addressController.dart';
import 'widgets/location.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final controller = Get.put(AddressController());

  // TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: Text(
            TxtContents.addAddressAppBarTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKeys,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  //name
                  TextFormField(
                    validator: (value) =>
                        MyValidator.validationEmptyText('Name', value),
                    controller: controller.name,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TxtContents.nameTitle),
                  ),
                  const SizedBox(
                    height: Sizes.spaceBetween,
                  ),
                  //phone no
                  TextFormField(
                    validator: (value) => MyValidator.validatePhoneno(value),
                    controller: controller.phoneNo,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: TxtContents.phoneNo),
                  ),
                  const SizedBox(
                    height: Sizes.spaceBetween,
                  ),
                  //use user's location
                  const CurrentLocation(),
                  const SizedBox(
                    height: Sizes.spaceBetween,
                  ),
                  //address
                  TextFormField(
                    controller: controller.houseNo,
                    validator: (value) =>
                        MyValidator.validationEmptyText('House no..', value),
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 43),
                          child: Icon(
                            Iconsax.house,
                          ),
                        ),
                        labelText: TxtContents.housenoTxt),
                  ),
                  const SizedBox(
                    height: Sizes.defaultSpace,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.addNewAddress();
                          },
                          child: const Text(TxtContents.saveBtn)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
