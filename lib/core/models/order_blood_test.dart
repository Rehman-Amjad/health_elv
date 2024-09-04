class OrderBloodTest {
  String? uid;
  String? email;
  bool? sameAsShipping;
  int? discount;
  String? shippingMethod;
  Map<String, dynamic>? shippingAddress;
  Map<String, dynamic>? secondAddress;

  OrderBloodTest({
    this.uid,
    this.email,
    this.sameAsShipping,
    this.discount,
    this.shippingMethod,
    this.shippingAddress,
    this.secondAddress,
  });

  // Convert OrderBloodTest object to JSON
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'sameAsShipping': sameAsShipping,
      'discount': discount,
      'shippingMethod': shippingMethod,
      'shippingAddress': shippingAddress,
      'secondAddress': secondAddress,
    };
  }

  // Convert JSON to OrderBloodTest object
  factory OrderBloodTest.toJson(Map<String, dynamic> json) {
    return OrderBloodTest(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      sameAsShipping: json['sameAsShipping'] as bool?,
      discount: json['discount'] as int?,
      shippingMethod: json['shippingMethod'] as String?,
      shippingAddress: json['shippingAddress'] as Map<String, dynamic>?,
      secondAddress: json['secondAddress'] as Map<String, dynamic>?,
    );
  }
}