import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class SignupController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final confirmPasswordTEC = TextEditingController();
  RxBool password = false.obs;
  RxBool passwordConfirm = false.obs;
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  onChangePassword() {
    password.value = !password.value;
  }

  onChangePasswordConfirm() {
    passwordConfirm.value = !passwordConfirm.value;
  }

  signUpWithFirebase() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailTEC.text.trim(),
          password: passwordTEC.text.trim(),
        );

        // Store user data in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'name': nameTEC.text.trim(),
          'email': emailTEC.text.trim(),
        });
        isLoading.value = false;
        Get.offAll(
          () => LoginScreen(),
          binding: AppBinding(),
        );
      } catch (e) {
        isLoading.value = false;
        Get.snackbar('Error', '$e');
      }
    }
  }
}
