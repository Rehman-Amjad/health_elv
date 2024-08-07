import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class SignupController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final dobTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final confirmPasswordTEC = TextEditingController();
  DateTime dobDateTime = DateTime.now();

  RxBool password = false.obs;
  RxBool passwordConfirm = false.obs;
  RxBool isLoading = false.obs;

  final authService = AuthService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onChangePassword() {
    password.value = !password.value;
  }

  onChangePasswordConfirm() {
    passwordConfirm.value = !passwordConfirm.value;
  }

  signUpWithFirebase(context) async {
    if (formKey.currentState!.validate()) {
      AppUtils().showLoading(context);
      UserData userData = UserData(
        email: emailTEC.text.trim(),
        password: passwordTEC.text.trim(),
        dob: dobTEC.text.trim(),
      );
      authService.signInWithEmailAndPassword(
        userData: userData,
      );
      AppUtils().dismissLoading();
    }
  }
}
