class OrderBloodTest {
  String? docId;
  String? uid;
  String? email;
  final String? testType;
  final String? testCategory;
  final String? testSubCategory;
  Map<String, dynamic>? shippingAddress;

  OrderBloodTest({
    this.docId,
    this.uid,
    this.email,
    this.testType,
    this.testCategory,
    this.testSubCategory,
    this.shippingAddress,
  });

  // Convert JSON to OrderBloodTest object
  factory OrderBloodTest.toJson(Map<String, dynamic> json) {
    return OrderBloodTest(
      docId: json['docId'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      testType: json['testType'] as String?,
      testCategory: json['testCategory'] as String?,
      testSubCategory: json['testSubCategory'] as String?,
      shippingAddress: json['shippingAddress'] as Map<String, dynamic>?,
    );
  }

  // Convert OrderBloodTest object to JSON
  Map<String, dynamic> toFirestore() {
    return {
      'docId': docId,
      'uid': uid,
      'email': email,
      'testType': testType,
      'testCategory': testCategory,
      'testSubCategory': testSubCategory,
      'shippingAddress': shippingAddress,
    };
  }
}
