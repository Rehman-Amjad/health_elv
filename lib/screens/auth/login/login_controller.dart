import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:health_elev8_app/screens/question_air/question_air_view.dart';

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
    final isQuestionAir = await getBool(SharePrefKeys.isQuestionAir);
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await auth
            .signInWithEmailAndPassword(
          email: emailTEC.text.trim(),
          password: passwordTEC.text.trim(),
        )
            .then((UserCredential? user) {
          if (user != null) {
            saveBool(SharePrefKeys.isUserLoggedIn, true);
            isLoading.value = false;
            if (isQuestionAir != null) {
              Get.offAllNamed(RoutesName.dashboardBottomNav);
            } else {
              if (isQuestionAir == null || isQuestionAir == false) {
                Get.offAll(
                  () => const QuestionAirView(),
                  binding: AppBinding(),
                );
              }
            }
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
