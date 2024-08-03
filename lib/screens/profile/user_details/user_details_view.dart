import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class UserDetailsView extends GetView<SignupController> {
  const UserDetailsView({super.key});

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
            child: CustomAppBar(
              marginTop: 30,
              title: 'User Details',
            ),
          ),
          body: Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 04.h),
                Container(
                  width: 126,
                  height: 126,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.blackColor,
                      )),
                  child: ClipOval(
                    child: ImageHelper(
                      image: AppAssets.avatar,
                      imageType: ImageType.asset,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Full Name',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(height: 02),
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
                  borderRadius: 10,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter full name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 02.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Email',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(height: 02),
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
                  borderRadius: 10,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Gender',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(height: 02),
                CustomFormField(
                  borderColor: Colors.transparent,
                  tec: controller.emailTEC,
                  hint: 'Gender',
                  prefixIcon: const Icon(
                    CupertinoIcons.person_2_fill,
                    size: 24,
                    color: AppColors.fieldColor,
                  ),
                  fontSize: 14,
                  textInputAction: TextInputAction.next,
                  contentPadding: 20,
                  borderRadius: 10,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter gender";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 02.h),
                _signUpButton(),
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
                text: 'Save',
                onTap: () {
                  controller.signUpWithFirebase();
                },
              ),
      ),
    );
  }

}
