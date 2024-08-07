import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class UserDetailsView extends GetView<ProfileController> {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      initState: (_) {
        Get.put(ProfileController());
        controller.getProfileInfo();
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
                controller.isLoading.isFalse
                    ? SizedBox(
                        width: 126,
                        height: 126,
                        child: ClipOval(
                          child: ImageHelper(
                            image: controller.userData?.imageUrl ??
                                AppAssets.avatar,
                            imageType: controller.userData?.imageUrl != null
                                ? ImageType.network
                                : ImageType.asset,
                            boxBorder: Border.all(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      )
                    : AppUtils.loader(),
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
                  hint: 'Email',
                  tec: controller.emailTEC,
                  fontSize: 14,
                  contentPadding: 20,
                  borderRadius: 10,
                  readOnly: true,
                  textInputAction: TextInputAction.next,
                  borderColor: Colors.transparent,
                  prefixIcon: Image.asset(
                    AppAssets.icEmail,
                    height: 24,
                    width: 24,
                  ),
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
                      text: 'Date Of Birth',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(height: 02),
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
                        String selectedDate =
                            DateFormat('dd, MMM, yyyy').format(date);
                        controller.dobTEC.text = selectedDate;
                        controller.dobDateTime = date;
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
                  tec: controller.ganderTEC,
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
                _updateButton(context),
                SizedBox(height: 02.h),
              ],
            ),
          ),
        );
      },
    );
  }

  _updateButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: CustomButton(
        radios: 10,
        text: 'Update',
        onTap: () {
          //controller.signUpWithFirebase(context);
        },
      ),
    );
  }
}
