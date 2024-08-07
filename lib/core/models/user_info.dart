class UserInfo {
  String? uid;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? dob;
  String? phoneNumber;
  String? email;

  UserInfo({
    this.uid,
    this.firstName,
    this.lastName,
    this.imageUrl = "https://i.postimg.cc/kg1yzFyb/User.jpg",
    this.dob,
    this.phoneNumber,
    this.email,
  });

  UserInfo.copy({
    this.uid,
    this.firstName,
    this.lastName,
    this.imageUrl = "https://i.postimg.cc/kg1yzFyb/User.jpg",
    this.dob,
    this.phoneNumber,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'imageUrl': imageUrl,
      'dob': dob,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  Map<String, dynamic> updateUser() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }


  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      imageUrl: map['imageUrl'],
      dob: map['dob'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }

}

