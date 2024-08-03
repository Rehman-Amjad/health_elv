import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:health_elev8_app/path_file.dart';

class ForgotController extends BaseController {
  final TextEditingController forgoPassController  = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      AppUtils().showToast(Colors.green, 'Password reset link sent to your email');
      forgoPassController.clear();
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '$e',backgroundColor: Colors.red);
    }
  }
}
