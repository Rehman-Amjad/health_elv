import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      initState: (_) {
        Get.put(LoginController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                SizedBox(height: 20.h),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    color: AppColors.blackColor,
                    text: 'Log In',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomFormField(
                  borderColor: Colors.transparent,
                  tec: controller.emailTEC,
                  hint: 'Email',
                  prefixIcon: Image.asset(
                    AppAssets.icEmail,
                    height: 24,
                    width: 24,
                  ),
                  fontSize: 14,
                  contentPadding: 20,
                  textInputAction: TextInputAction.next,
                  borderRadius: 18,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email address";
                    } else if (!AppUtils.isEmail(value)) {
                      return "Email address is invalid";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 02.h),
                Obx(
                  () => CustomFormField(
                    showPassword: true,
                    obscureText: controller.password.value,
                    prefixIcon: Image.asset(
                      AppAssets.icPassword,
                      height: 24,
                      width: 24,
                    ),
                    borderColor: Colors.transparent,
                    tec: controller.passwordTEC,
                    hint: 'Password',
                    fontSize: 14,
                    contentPadding: 20,
                    textInputAction: TextInputAction.done,
                    borderRadius: 18,
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      padding: const EdgeInsets.only(right: 10),
                      icon: const Icon(
                        Icons.visibility,
                        color: AppColors.greyColor,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 6) {
                        return 'Password length must be 6 or greater';
                      }
                      return null;
                    },
                  ),
                ),
                _forgotPassword(),
                SizedBox(height: 06.h),
                _signUpButton(),
                SizedBox(height: 08.h),
                _haveAccount(),
              ],
            ),
          ),
        );
      },
    );
  }

  _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Get.toNamed(RoutesName.forgotScreen);
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              fontSize: 10,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  _signUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blackColor,
                ),
              )
            : CustomButton(
                radios: 10,
                text: 'Log in',
                onTap: () {
                  controller.loginWithFirebase();
                },
              ),
      ),
    );
  }

  _haveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New User? ",
          style: GoogleFonts.inter(
            color: AppColors.fieldColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.toNamed(RoutesName.signupScreen);
          },
          child: Text(
            "Register Now",
            style: GoogleFonts.inter(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
