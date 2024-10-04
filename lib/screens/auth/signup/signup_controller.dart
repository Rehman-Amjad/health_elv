import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class SignupController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final phoneTEC = TextEditingController();
  final genderTEC = TextEditingController();
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

  signUpWithFirebase(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      AppUtils().showLoading(context);
      UserData userData = UserData(
        fullName: nameTEC.text.trim(),
        email: emailTEC.text.trim(),
        phoneNumber: phoneTEC.text.trim(),
        password: passwordTEC.text.trim(),
        gander: genderTEC.text.trim(),
        dob: dobTEC.text.trim(),
      );
     await authService.signInWithEmailAndPassword(
        userData: userData,
      );
      AppUtils().dismissLoading();
    }
  }
}
