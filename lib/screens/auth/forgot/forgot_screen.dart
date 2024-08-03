import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/export.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotController = Get.find<ForgotController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(marginTop: 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  color: AppColors.blackColor,
                  text: 'Forgot Password',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 1.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Please Write your ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.fieldColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Email ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: 'to receive the confirmation',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.fieldColor,
                      ),
                    ),
                    TextSpan(
                      text: 'code to set new ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.fieldColor,
                      ),
                    ),
                    TextSpan(
                      text: 'password.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomFormField(
                borderColor: Colors.transparent,
                tec: forgotController.forgoPassController,
                hint: 'Email',
                prefixIcon: Image.asset(
                  AppAssets.icEmail,
                  height: 24,
                  width: 24,
                ),
                fontSize: 14,
                contentPadding: 20,
                borderRadius: 18,
                textInputAction: TextInputAction.next,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email address";
                  } else if (!AppUtils.isEmail(value)) {
                    return "Email address is invalid";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                radios: 10,
                text: 'Confirm Email',
                onTap: () {
                  forgotController.resetPassword(
                      forgotController.forgoPassController.text.trim());
                  // Get.offAllNamed(RoutesName.signupScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
