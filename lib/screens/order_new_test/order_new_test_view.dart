import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../path_file.dart';

class OrderNewTestView extends GetView<OrderNewTestController> {
  const OrderNewTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderNewTestController>(
      initState: (_) {
        Get.put(OrderNewTestController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 70),
            child: CustomAppBar(
              title: "Order Blood Test",
              marginTop: 30,
            ),
          ),
          body: Form(
            key: controller.formKey,
            child: controller.isLoading.isFalse
                ? ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Test Info',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 01.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: getCustomDropDownTitle(
                              title: 'Test Type',
                              child: CustomDropdown<TestTypeModel>(
                                hintText: 'Test Type',
                                items: controller.testTypeList,
                                onChanged: (testType) {
                                  if (testType != null) {
                                    controller.getTestsCategoryDropDown(
                                        context, testType.name);
                                    controller.testType = testType.name;
                                  }
                                  controller.update();
                                },
                                decoration: decoration(),
                              ),
                            ),
                          ),
                          SizedBox(width: 02.w),
                          Expanded(
                            flex: 1,
                            child: getCustomDropDownTitle(
                              title: 'Test Category',
                              child: CustomDropdown<TestCategoryModel>(
                                hintText: 'Test Category',
                                items: controller.testCategoryList,
                                onChanged: (testCategory) {
                                  if (testCategory != null) {
                                    controller.getTestsSubCategoryDropDown(
                                        context, testCategory.name);
                                    controller.testCategory = testCategory.name;
                                  }
                                  controller.update();
                                },
                                decoration: decoration(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 02.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: getCustomDropDownTitle(
                              title: 'Test Sub-Category',
                              child: CustomDropdown<TestSubCategoryModel>(
                                hintText: 'Test Sub-Category',
                                items: controller.testSubCategoryList,
                                onChanged: (value) {
                                  controller.testSubCategory = value!.name;
                                  controller.update();
                                },
                                decoration: decoration(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 02.h),
                      CustomFormField(
                        tec: controller.testDateTEC,
                        readOnly: true,
                        hint: 'Test Date',
                        fontSize: 14,
                        contentPadding: 20,
                        borderRadius: 10,
                        fillColor: AppColors.whiteColor,
                        borderColor: AppColors.blackColor,
                        textInputAction: TextInputAction.next,
                        onFieldOnTap: () {
                          DatePickerBdaya.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2050, 3, 5),
                            onConfirm: (DateTime date) {
                              String selectedDate =
                              DateFormat('dd, MMM, yyyy').format(date);
                              controller.testDateTEC.text = selectedDate;
                              controller.dobDateTime = date;
                              controller.update();
                            },
                            currentTime: DateTime(2000, 3, 5),
                          );
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter test date";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 02.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Contact',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 01.h),
                      LabelFormField(
                        tec: controller.emailTEC,
                        hint: 'Email',
                        fontSize: 14,
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
                      SizedBox(height: 02.h),
                      SizedBox(height: 02.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Address Info',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 01.h),
                      LabelFormField(
                        tec: controller.firstNameTEC,
                        hint: 'First Name',
                        fontSize: 14,
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter first name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 01.h),
                      LabelFormField(
                        tec: controller.lastNameTEC,
                        hint: 'Last Name',
                        fontSize: 14,
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter last name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 01.h),
                      LabelFormField(
                        tec: controller.phoneNumberTEC,
                        hint: 'Phone Number',
                        fontSize: 14,
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter phone number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 01.h),
                      LabelFormField(
                        tec: controller.addressTEC,
                        hint: 'Address',
                        fontSize: 14,
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 02.h),
                      CustomButton(
                        text: 'Submit',
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.saveToDatabase(context);
                          }
                        },
                        backgroundColor: AppColors.blackColor,
                        margin: const EdgeInsets.symmetric(horizontal: 70),
                        radios: 05,
                      ),
                      SizedBox(height: 04.h),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
          ),
        );
      },
    );
  }

  getCustomDropDownTitle({title, required Widget child}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: GoogleFonts.poppins(
            color: AppColors.blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}
