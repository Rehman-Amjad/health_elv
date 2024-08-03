import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/core/service/cache_manager.dart';
import 'package:health_elev8_app/path_file.dart';

import '../../../core/data/shared_pref/share_pref_keys.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  RxBool password = false.obs;
  RxBool isLoading = false.obs;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onChangePassword() {
    password.value = !password.value;
  }

   loginWithFirebase() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await auth.signInWithEmailAndPassword(
          email: emailTEC.text.trim(),
          password: passwordTEC.text.trim(),
        ).then((UserCredential? user) {
          if (user != null) {
            saveBool(SharePrefKeys.isUserLoggedIn,true);
            isLoading.value = false;
            Get.offAllNamed(RoutesName.dashboardBottomNav);
          }
        });
      } catch (e) {
        isLoading.value = false;
        Get.snackbar('Error', 'Please try again later',
            backgroundColor: Colors.red);
      }
    }
  }

  @override
  void dispose() {
    emailTEC.dispose();
    passwordTEC.dispose();
    super.dispose();
  }
}
