import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class ProfileController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final phoneTEC = TextEditingController();
  final dobTEC = TextEditingController();
  final ganderTEC = TextEditingController();
  DateTime dobDateTime = DateTime.now();

  final firebase = FirebaseAuth.instance;
  final authService = AuthService();
  UserData? userData;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }

  getProfileInfo() async {
    isLoading.value = true;
    userData = await authService.getUserData();
    if (userData != null) {
      nameTEC.text = userData?.fullName ?? "--";
      emailTEC.text = userData?.email ?? "--";
      phoneTEC.text = userData?.phoneNumber ?? "--";
      dobTEC.text = userData?.dob ?? "--";
    }
    isLoading.value = false;
    update();
  }

  updateProfileInfo(context) async {
    AppUtils().showLoading(context);
    UserData userData = UserData(
      uid: firebase.currentUser?.uid,
      fullName: firebase.currentUser?.uid,
      dob: firebase.currentUser?.uid,
      phoneNumber: firebase.currentUser?.uid,
      email: firebase.currentUser?.uid,
      password: firebase.currentUser?.uid,
    );

    await authService.updateUserData(userData).then((isUpdate) {
      if (isUpdate) {
        AppUtils().showToast(text: "Profile Updated Successfully.");
        getProfileInfo();
      }
    });
    AppUtils().dismissLoading();
    update();
  }
}
