import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneno;
  final String? currentLocation;
  final String houseno;

  // final String street;
  // final String city;
  // final String state;
  // final String? postalCode;
  // final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel(
      {required this.id,
      required this.name,
      required this.phoneno,
      this.currentLocation,
      required this.houseno,
      this.dateTime,
      this.selectedAddress = true});

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Phoneno': phoneno,
      'CurrentLocation': currentLocation,
      'HouseNo': houseno,
      'DateTime': dateTime,
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    if (doc.data() != null) {
      return AddressModel(
          id: doc.id,
          name: data['Name'] ,
          phoneno: data['Phoneno'] ,
          currentLocation: data['CurrentLocation'] ,
          houseno: data['HouseNo'],
          selectedAddress: data['SelectedAddress'] ,
          dateTime: (data['DateTime'] as Timestamp).toDate());
    } else {
      return AddressModel.empty();
    }
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id']?? '',
      name: data['Name'] ?? '',
      phoneno: data['Phoneno'] ?? '',
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      selectedAddress: data['SelectedAddress'] as bool ,
      houseno: data['HouseNo'] as String ,
      currentLocation: data['CurrentLocation'] as String,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    // return super.toString();
    return '$currentLocation, $houseno';
  }

  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        phoneno: '',
        currentLocation: '',
        houseno: '',
      );
}
