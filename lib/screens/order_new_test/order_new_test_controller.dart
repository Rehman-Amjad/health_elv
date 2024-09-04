import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class OrderNewTestController extends BaseController {
  var formKey = GlobalKey<FormState>();
  RxInt index = 1.obs;
  RxBool saveInfoForNextTime = false.obs;
  RxBool isSameAddress = true.obs;
  final firebaseAuth = FirebaseAuth.instance;
  final firestoreService = FireStoreService();

  ///
  var emailTEC = TextEditingController();
  final firstNameTEC = TextEditingController();
  final lastNameTEC = TextEditingController();
  final phoneNumberTEC = TextEditingController();
  final addressTEC = TextEditingController();

  final diffFirstNameTEC = TextEditingController();
  final diffLastNameTEC = TextEditingController();
  final diffPhoneNumberTEC = TextEditingController();
  final diffAddressTEC = TextEditingController();

  @override
  void onInit() {
    emailTEC = TextEditingController(text: firebaseAuth.currentUser?.email);
    super.onInit();
  }

  saveToDatabase(context) async{
    AppUtils().showLoading(context);
    OrderBloodTest orderBloodTest = OrderBloodTest();
    Map<String, dynamic> shippingAddress = {};
    Map<String, dynamic> secondAddress = {};
    if (isSameAddress.isTrue) {
      shippingAddress = {
        "firstName": firstNameTEC.text,
        "lastName": lastNameTEC.text,
        "phoneNumber": phoneNumberTEC.text,
        "address": addressTEC.text,
      };
      orderBloodTest = OrderBloodTest(
        uid: firebaseAuth.currentUser?.uid,
        email: emailTEC.text,
        discount: 0,
        sameAsShipping: isSameAddress.value,
        shippingMethod: "Standard",
        shippingAddress: shippingAddress,
        secondAddress: secondAddress,
      );
    } else {
      shippingAddress = {
        "firstName": firstNameTEC.text,
        "lastName": lastNameTEC.text,
        "phoneNumber": phoneNumberTEC.text,
        "address": addressTEC.text,
      };
      secondAddress = {
        "firstName": diffFirstNameTEC.text,
        "lastName": diffLastNameTEC.text,
        "phoneNumber": diffPhoneNumberTEC.text,
        "address": diffAddressTEC.text,
      };
      orderBloodTest = OrderBloodTest(
        email: emailTEC.text,
        discount: 0,
        sameAsShipping: isSameAddress.value,
        shippingMethod: "Standard",
        shippingAddress: shippingAddress,
        secondAddress: secondAddress,
      );
    }

    await firestoreService.saveOrderBloodTest(orderBloodTest);

    AppUtils().dismissLoading();
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    emailTEC.clear();
    firstNameTEC.clear();
    lastNameTEC.clear();
    phoneNumberTEC.clear();
    addressTEC.clear();

    ///second address
    diffFirstNameTEC.clear();
    diffLastNameTEC.clear();
    diffPhoneNumberTEC.clear();
    diffAddressTEC.clear();
    super.dispose();
  }
}
