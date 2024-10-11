import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class OrderNewTestController extends BaseController {
  var formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  final firebaseAuth = FirebaseAuth.instance;
  final firestoreService = FireStoreService();

  ///
  var emailTEC = TextEditingController();
  final testDateTEC = TextEditingController();
  DateTime testDateTime = DateTime.now();

  ///drop downs lists
  List<TestTypeModel> testTypeList = [];
  String testType = "";

  final firstNameTEC = TextEditingController();
  final lastNameTEC = TextEditingController();
  final phoneNumberTEC = TextEditingController();
  final addressTEC = TextEditingController();

  Map<String, dynamic> shippingAddress = {};

  @override
  void onInit() {
    emailTEC = TextEditingController(text: firebaseAuth.currentUser?.email);
    getTestsTypeDropDown();
    super.onInit();
  }

  /// All Drop downs
  getTestsTypeDropDown() async {
    isLoading = true.obs;
    testTypeList = await firestoreService.getTestTypes();
    isLoading = false.obs;
    update();
  }


  saveToDatabase(context) async {
    AppUtils().showLoading(context);
    shippingAddress = {
      "firstName": firstNameTEC.text,
      "lastName": lastNameTEC.text,
      "phoneNumber": phoneNumberTEC.text,
      "address": addressTEC.text,
    };
    OrderBloodTest orderBloodTest = OrderBloodTest(
      uid: firebaseAuth.currentUser?.uid,
      email: emailTEC.text,
      testType: testType,
      testDate: Timestamp.fromDate(testDateTime),
      shippingAddress: shippingAddress,
    );

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
    super.dispose();
  }
}
