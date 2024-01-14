import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetCoordinates {
  Future<Position> getCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position p = await Geolocator.getCurrentPosition();
    print(p);
    return p;
  }

 Future<String> getCurrentAddress() async {
    Position currentCoordinates = await getCurrentLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentCoordinates.latitude, currentCoordinates.longitude);

    return "${placemarks[0].street}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}";
    
  }
}
