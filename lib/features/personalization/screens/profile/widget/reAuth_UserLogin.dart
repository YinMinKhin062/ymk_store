import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';
import 'package:ymk_store/features/personalization/controllers/userController.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';
import 'package:ymk_store/utils/validators/validation.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class ReAuthUserLogin extends StatelessWidget {
  const ReAuthUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(TxtContents.reAuthAppBarTitle),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            children: [
              //email
              TextFormField(
                controller: controller.verifyEmail,
                validator: (value) => MyValidator.validateEmail(value),
                decoration: const InputDecoration(
                    labelText: TxtContents.emailTitle,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(
                height: Sizes.spaceBetween,
              ),
              //password
              Obx(
                () => TextFormField(
                  obscureText: controller.ishidePwd.value,
                  controller: controller.verifyPwd,
                  validator: (value) =>
                      MyValidator.validationEmptyText('Password', value),
                  decoration: InputDecoration(
                      labelText: TxtContents.lbPwdTxt,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: GestureDetector(
                          onTap: () => controller.ishidePwd.value =
                              !controller.ishidePwd.value,
                          child: Icon(controller.ishidePwd.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye))),
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.reAuthEmailAndPwd(),
                    child: const Text(TxtContents.verifyTxt)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
