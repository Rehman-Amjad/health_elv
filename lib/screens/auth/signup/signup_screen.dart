import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      initState: (_) {
        Get.put(SignupController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 70),
            child: CustomAppBar(marginTop: 30),
          ),
          body: Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 08.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      color: AppColors.blackColor,
                      text: 'Sign Up',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                CustomFormField(
                  tec: controller.nameTEC,
                  hint: 'Full Name',
                  borderColor: Colors.transparent,
                  fontSize: 14,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.greyColor,
                    size: 24,
                  ),
                  textInputAction: TextInputAction.next,
                  contentPadding: 20,
                  borderRadius: 18,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter full name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 02.h),
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
                  textInputAction: TextInputAction.next,
                  contentPadding: 20,
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
                CustomFormField(
                  borderColor: Colors.transparent,
                  tec: controller.dobTEC,
                  readOnly: true,
                  hint: 'DOB',
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                    color: AppColors.fieldColor,
                    size: 24,
                  ),
                  fontSize: 14,
                  textInputAction: TextInputAction.next,
                  contentPadding: 20,
                  borderRadius: 18,
                  onFieldOnTap: () {
                    DatePickerBdaya.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 3, 5),
                      maxTime: DateTime.now(),
                      onChanged: (date) {
                        debugPrint('change $date');
                      },
                      onConfirm: (DateTime date) {
                        String selectedDate=DateFormat('dd, MMM, yyyy').format(date);
                        controller.dobTEC.text=selectedDate;
                        controller.dobDateTime=date;
                        controller.update();
                      },
                      currentTime: DateTime(2000, 3, 5),
                    );
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter dob";
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
                    textInputAction: TextInputAction.done,
                    contentPadding: 20,
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
                SizedBox(height: 02.h),
                Obx(
                  () => CustomFormField(
                    showPassword: true,
                    obscureText: controller.passwordConfirm.value,
                    prefixIcon: Image.asset(
                      AppAssets.icPassword,
                      height: 24,
                      width: 24,
                    ),
                    borderColor: Colors.transparent,
                    tec: controller.confirmPasswordTEC,
                    hint: 'Confirm Password',
                    fontSize: 14,
                    contentPadding: 20,
                    borderRadius: 18,
                    textInputAction: TextInputAction.done,
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
                        return "Please enter confirm password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                _signUpButton(),
                SizedBox(height: 8.h),
                _haveAccount(),
              ],
            ),
          ),
        );
      },
    );
  }

  _signUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : CustomButton(
                radios: 10,
                text: 'Sign Up',
                onTap: () {
                  controller.signUpWithFirebase();
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
          "Already have an account? ",
          style: GoogleFonts.inter(
            color: AppColors.fieldColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.toNamed(RoutesName.loginScreen);
          },
          child: Text(
            "Login",
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
