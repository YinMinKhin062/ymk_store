import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/personalization/controllers/updateNameController.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';
import '../../../../utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(TxtContents.changeNameAppBarTitle),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            Form(
                key: controller.updateNameFormkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.updatedName,
                      validator: (value) =>
                          MyValidator.validationEmptyText('Name', value),
                      decoration: const InputDecoration(
                        labelText: TxtContents.nameTitle,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBetweenSections,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.updateName();
                            },
                            child: const Text("Save")))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
