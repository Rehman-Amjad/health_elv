class UserData {
  String? uid;
  String? fullName;
  String? imageUrl;
  String? dob;
  String? phoneNumber;
  String? email;
  String? password;

  UserData({
    this.uid,
    this.fullName,
    this.imageUrl = "https://i.postimg.cc/kg1yzFyb/User.jpg",
    this.dob,
    this.phoneNumber,
    this.email,
    this.password,
  });


  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'imageUrl': imageUrl,
      'dob': dob,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
  }

  Map<String, dynamic> updateUser() {
    return {
      'fullName': fullName,
      'dob': dob,
      'phoneNumber': phoneNumber,
    };
  }


  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid'],
      fullName: map['fullName'],
      imageUrl: map['imageUrl'],
      dob: map['dob'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }

}

