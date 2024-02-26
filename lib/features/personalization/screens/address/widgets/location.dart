import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ymk_store/utils/validators/validation.dart';

import '../../../controllers/addressController.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  Position? currentLocation;
  String? currentAddress;
  TextEditingController address_controller = TextEditingController();
  final controller = AddressController.instance;

  @override
  Widget build(BuildContext context) {
    return Row(
        // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: TextFormField(
              validator: (value) =>
                  MyValidator.validationEmptyText('Current Location', value),
              controller: address_controller,
              readOnly: true,
              maxLines: 1,
              decoration: InputDecoration(
                  label: const Text("Use current location"),
                  prefixIcon: const Icon(Iconsax.location),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      currentLocation = await getCurrentLocation();
                      getCurrentAddress();
                      address_controller.text = currentAddress!;
                      if(currentAddress!=null){
                        controller.currentLocation.text=currentAddress!;
                      }
                    },
                    child: const Icon(
                      Iconsax.location_add,
                      color: Colors.deepPurple,
                    ),
                  )),
            ),
          ),
          // SizedBox(width: Sizes.spaceBetween,),
          // Flexible(
          //   child: ElevatedButton(onPressed: ()async{
          //      currentLocation = await getCurrentLocation();
          //               getCurrentAddress();
          //               address_controller.text = currentAddress!;
          //   }, child:Icon(Iconsax.location_add),
          // ))
        ],
      );
    
    // child: CircularContainer(
    //   child: Row(
    //     children: [
    //       Text.rich(TextSpan(children: [
    //         TextSpan(text: "${currentStreet}"),
    //         TextSpan(text: "${currentLocationState}"),
    //         TextSpan(text: "${currentCountry}"),
    //       ])),
    //       // Flexible(
    //       //     child: Text(
    //       //         "${currentLocation?.latitude} ${currentLocation?.longitude}")),
    //       IconButton(
    //           onPressed: () async {
    //             currentLocation = await getCurrentLocation();
    //              getCurrentAddress();
    //             setState(() {});
    //           },
    //           icon: const Icon(Iconsax.location_add)),
    //     ],
    //   ),
    // ),
  }

  Future<Position> getCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position p = await Geolocator.getCurrentPosition();
    print(p);
    return p;
  }

  void getCurrentAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation!.latitude, currentLocation!.longitude);

    setState(() {
      currentAddress =
          "${placemarks[0].name} ${placemarks[0].street}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}";
    });
  }
}
