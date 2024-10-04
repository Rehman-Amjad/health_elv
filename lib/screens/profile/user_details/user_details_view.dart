import 'package:animated_custom_dropdown/custom_dropdown.dart';
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
            child: controller.isLoading.isFalse
                ? ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      SizedBox(height: 04.h),
                      GestureDetector(
                        onTap: () {
                          controller.pickAndUpdateProfileImage(context);
                        },
                        child: ImageHelper(
                          image:
                              controller.userData?.imageUrl ?? AppAssets.avatar,
                          imageType: controller.userData?.imageUrl != null
                              ? ImageType.network
                              : ImageType.asset,
                          imageShape: ImageShape.circle,
                          width: 126,
                          height: 126,
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
                            text: 'Phone',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 02),
                      CustomFormField(
                        hint: 'Phone Number',
                        tec: controller.phoneTEC,
                        fontSize: 14,
                        contentPadding: 20,
                        borderRadius: 10,
                        textInputAction: TextInputAction.next,
                        borderColor: Colors.transparent,
                        prefixIcon: const Icon(
                          Icons.phone_iphone,
                          size: 24,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter phone number";
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
                      SizedBox(height: 02.h),
                      CustomDropdown<String>(
                        initialItem: controller.genderTEC.text,
                        hintText: 'Gender',
                        items: const ["Male", "Female"],
                        onChanged: (gander) {
                          controller.genderTEC.text = gander!;
                        },
                        validateOnChange: true,
                        validator: (value) {
                          if (value == null) {
                            return "Select gender";
                          }
                          return null;
                        },
                        decoration: decoration(
                          prefixIcon: const Icon(Icons.male),
                          bolderColor: Colors.transparent,
                          headerFontSize: 14.0,
                          fillColor: AppColors.greyColor.withOpacity(0.1),
                        ),
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
                      _updateButton(context),
                      SizedBox(height: 02.h),
                    ],
                  )
                : AppUtils.loader(),
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
          controller.updateProfileInfo(context);
        },
      ),
    );
  }
}
