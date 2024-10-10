import 'package:cloud_firestore/cloud_firestore.dart';

class OrderBloodTest {
  String? docId;
  String? uid;
  String? email;
  final String? testType;
  final Timestamp? testDate;
  Map<String, dynamic>? shippingAddress;

  OrderBloodTest({
    this.docId,
    this.uid,
    this.email,
    this.testType,
    this.testDate,
    this.shippingAddress,
  });

  factory OrderBloodTest.toJson(Map<String, dynamic> json) {
    return OrderBloodTest(
      docId: json['docId'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      testType: json['testType'] as String?,
      testDate: json['testDate'] as Timestamp,
      shippingAddress: json['shippingAddress'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'docId': docId,
      'uid': uid,
      'email': email,
      'testType': testType,
      'testDate': testDate,
      'shippingAddress': shippingAddress,
    };
  }
}
