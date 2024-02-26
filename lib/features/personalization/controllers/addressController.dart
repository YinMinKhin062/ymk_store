import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/common/widgets/text/headerSection.dart';
import 'package:ymk_store/features/personalization/models/addressModel.dart';
import 'package:ymk_store/features/personalization/screens/address/addNewAddress.dart';
import 'package:ymk_store/features/personalization/screens/address/singleAddress.dart';
import 'package:ymk_store/features/personalization/screens/address/widgets/location.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/helper/cloudHelperFunctions.dart';
import 'package:ymk_store/utils/networkConnection/networkManager.dart';
import 'package:ymk_store/utils/popup/fullScreenLoader.dart';

import '../../../data/repositories/Address/addressRepository.dart';
import '../../../utils/networkConnection/loaders.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  //form variable
  final name = TextEditingController();
  final phoneNo = TextEditingController();
  final currentLocation = TextEditingController();
  final houseNo = TextEditingController();
  GlobalKey<FormState> formKeys = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  final addressRepo = Get.put(AddressRepository());

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

//fetch address
  Future<List<AddressModel>> fetchAddreses() async {
    try {
      final addresses = await addressRepo.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress, //finding selectedaddress is true
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      Loaders.errorSnackBar(title: "Address not Found", message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      //clear current selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepo.updateSelectedField(selectedAddress.value.id, false);

        //assign new selected address
        newSelectedAddress.selectedAddress = true;
        selectedAddress.value = newSelectedAddress;

        //update selected address value in firebase
        await addressRepo.updateSelectedField(selectedAddress.value.id, true);
      }
    } catch (e) {
      Loaders.errorSnackBar(title: "Error in selecting address");
    }
  }

  Future<void> addNewAddress() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          "Adding Address....", assetImage.loading1);

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //check form validation
      if (!formKeys.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //save address
      final AddressModel address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneno: phoneNo.text.trim(),
          houseno: houseNo.text.trim(),
          currentLocation: currentLocation.text.trim(),
          dateTime: DateTime.now());

      final id = await addressRepo.addAddress(address);

      //update selected address status
      address.id = id;
      await selectAddress(address);

      FullScreenLoader.stopLoading();
      Loaders.successSnackBar(title: "Successfulley Added Address");

      //refresh address data
      refreshData.toggle();

      //clear form data
      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Can\'t Add Address', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNo.clear();
    currentLocation.clear();
    houseNo.clear();
    formKeys.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopUp(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.spaceBetweenSections - 3),
          child: SizedBox(
            child: Column(
              children: [
                const HeaderSection(
                  title: "Select Address",
                  btnTitle: "",
                  showActionBtn: false,
                ),
                const SizedBox(
                  height: Sizes.spaceBetweenSections - 4,
                ),
                FutureBuilder(
                    future: fetchAddreses(),
                    builder: (_, snapshot) {
                      final res = CloudHelperFunctions.checkMultiRecordState(
                          snapshot: snapshot);
                      if (res != null) return res;
                      final addresses = snapshot.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: addresses.length,
                        itemBuilder: (context, index) => SingleAddress(
                          address: addresses[index],
                          onTap: () async {
                            await selectAddress(addresses[index]);
                            Get.back();
                          },
                        ),
                      );
                    }),
                  const SizedBox(height: Sizes.spaceBetween,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => Get.to(()=>const AddNewAddress()), child:const Text('Add New Address'))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
