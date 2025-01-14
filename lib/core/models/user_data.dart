import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? uid;
  String? fullName;
  String? imageUrl;
  String? gander;
  String? dob;
  String? phoneNumber;
  String? email;
  String? password;
  Timestamp? joinDate;

  UserData({
    this.uid,
    this.fullName,
    this.imageUrl = "https://i.postimg.cc/kg1yzFyb/User.jpg",
    this.gander,
    this.dob,
    this.phoneNumber,
    this.email,
    this.password,
    this.joinDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'imageUrl': imageUrl,
      'gander': gander,
      'dob': dob,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'joinDate': joinDate ?? FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> updateUser() {
    return {
      'fullName': fullName,
      'gander': gander,
      'dob': dob,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid'],
      fullName: map['fullName'],
      imageUrl: map['imageUrl'],
      gander: map['gander'],
      dob: map['dob'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      joinDate: map['joinDate'], // Fetch joinDate from map
    );
  }
}
