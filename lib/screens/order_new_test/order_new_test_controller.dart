import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class OrderNewTestController extends BaseController {
  var formKey = GlobalKey<FormState>();

  RxBool isLoading=false.obs;

  final firebaseAuth = FirebaseAuth.instance;
  final firestoreService = FireStoreService();

  ///
  var emailTEC = TextEditingController();
  final testDateTEC = TextEditingController();
  DateTime dobDateTime = DateTime.now();

  ///for blood test
  ///drop downs lists
  List<TestTypeModel> testTypeList = [];
  String testType = "";

  List<TestCategoryModel> testCategoryList = [];
  String testCategory = "";

  List<TestSubCategoryModel> testSubCategoryList = [];
  String testSubCategory = "";

  final firstNameTEC = TextEditingController();
  final lastNameTEC = TextEditingController();
  final phoneNumberTEC = TextEditingController();
  final addressTEC = TextEditingController();

  @override
  void onInit() {
    emailTEC = TextEditingController(text: firebaseAuth.currentUser?.email);
    getTestsTypeDropDown();
    super.onInit();
  }

  /// All Drop downs
  getTestsTypeDropDown() async {
    isLoading=true.obs;
    testTypeList = await firestoreService.getTestTypes();
    isLoading=false.obs;
    update();
  }

  getTestsCategoryDropDown(context, String testType) async {
    AppUtils().showLoading(context);
    testCategoryList.clear();
    testCategoryList = await firestoreService.getTestCategory(
      testType: testType,
    );
    AppUtils().dismissLoading();
    update();
  }

  getTestsSubCategoryDropDown(context, String testCategory) async {
    AppUtils().showLoading(context);
    testCategoryList.clear();
    testSubCategoryList = await firestoreService.getTestSubCategory(
      testCategory: testCategory,
    );
    AppUtils().dismissLoading();
    update();
  }

  saveToDatabase(context) async{
    AppUtils().showLoading(context);
    OrderBloodTest orderBloodTest = OrderBloodTest();
    Map<String, dynamic> shippingAddress = {};

    orderBloodTest = OrderBloodTest(
      uid: firebaseAuth.currentUser?.uid,
      email: emailTEC.text,
      testType: testType,
      testCategory: testCategory,
      testSubCategory: testSubCategory,
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
