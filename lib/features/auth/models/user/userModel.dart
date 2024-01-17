

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/formatter/formatter.dart';

class UserModel {
  final String id;
  final String userName;
  final String email;
  String phoneno;
  String? profilepic;
  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.phoneno,
      this.profilepic});

  // Map<String,dynamic> toJson()=>_$UserModelToJson(this);

  Map<String, dynamic> toJson() {
    return {
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneno,
      'ProfilePicture': profilepic,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    // if(doc.data()!=null){
    final data = doc.data()!;
    return UserModel(
        id: doc.id,
        userName: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneno: data['PhoneNumber'] ?? '',
        profilepic: data['ProfilePicture'] ?? '');
    //}
  }

 
}
