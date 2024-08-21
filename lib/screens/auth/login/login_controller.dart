import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  RxBool password = false.obs;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  loginWithFirebase(context) async {
    final isQuestionAir = await getBool(SharePrefKeys.isQuestionAir);
    if (formKey.currentState!.validate()) {
      try {
        AppUtils().showLoading(context);
        await auth
            .signInWithEmailAndPassword(
          email: emailTEC.text.trim(),
          password: passwordTEC.text.trim(),
        )
            .then((UserCredential? user) {
          if (user != null) {
            saveBool(SharePrefKeys.isUserLoggedIn, true);
            AppUtils().dismissLoading();
            if (isQuestionAir != null) {
              Get.offAllNamed(RoutesName.dashboardBottomNav);
            } else {
              if (isQuestionAir == null || isQuestionAir == false) {
                Get.offAll(
                  () => const HomeView(),
                  binding: AppBinding(),
                );
              }
            }
          }
        });
      } catch (e) {
        AppUtils().dismissLoading();
        AppUtils().showToast(
          text: 'Please try again later',
          bgColor: Colors.red,
        );
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
