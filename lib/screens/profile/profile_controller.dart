import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class ProfileController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final dobTEC = TextEditingController();
  final ganderTEC = TextEditingController();
  DateTime dobDateTime = DateTime.now();

  final firebase = FirebaseAuth.instance;
  final fireStoreService = FireStoreService();
  UserData? userData;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }

  getProfileInfo() async {
    isLoading.value = true;
    userData = await fireStoreService.getUserData(
      firebase.currentUser?.uid,
    );
    if (userData != null) {
      nameTEC.text = userData?.fullName ?? "--";
      emailTEC.text = userData?.email ?? "--";
      dobTEC.text = userData?.dob ?? "--";
    }
    isLoading.value = false;
    update();
  }
}
