import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              title: "Order new blood test",
              marginTop: 30,
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 02.h),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.darkGreyColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 110),
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            text: "Order new blood test",
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 02.h),
                      getTabs(
                        index: controller.index.value,
                        title: 'Information',
                      ),
                      SizedBox(height: 02.h),
                      if (controller.index.value == 1)
                        _informationTab()
                      else if (controller.index.value == 2)
                        _shippingTab()
                      else
                        _paymentTab(),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  getTabs({index, title}) {
    Color color1 = index == 1 ? AppColors.blackColor : AppColors.fieldColor;
    Color color2 = index == 2 ? AppColors.blackColor : AppColors.fieldColor;
    Color color3 = index == 3 ? AppColors.blackColor : AppColors.fieldColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: 'Information',
          fontSize: 10,
          color: color1,
          fontWeight: FontWeight.w600,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: color1,
        ),
        SizedBox(width: 01.w),
        AppText(
          text: 'Shipping',
          fontSize: 10,
          color: color2,
          fontWeight: FontWeight.w600,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: color2,
        ),
        SizedBox(width: 01.w),
        AppText(
          text: 'Payment',
          fontSize: 10,
          color: color3,
          fontWeight: FontWeight.w600,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: color3,
        ),
      ],
    );
  }

  _informationTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
          tec: TextEditingController(),
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
        SizedBox(height: 04.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Shipping address',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ],
        ),
        SizedBox(height: 01.h),
        LabelFormField(
          tec: TextEditingController(),
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
          tec: TextEditingController(),
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
          tec: TextEditingController(),
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
          tec: TextEditingController(),
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
        SizedBox(height: 01.h),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const AppText(
              text: "Save the information for next time",
              fontSize: 12,
              color: AppColors.fieldColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 01.h),
        CustomButton(
          text: 'Continue',
          onTap: () {
            if (controller.index.value == 1) {
              controller.index.value++;
            }
            controller.update();
          },
          backgroundColor: AppColors.blackColor,
          margin: const EdgeInsets.symmetric(horizontal: 70),
          radios: 05,
        ),
        SizedBox(height: 04.h),
      ],
    );
  }

  _shippingTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _shipInfoCard(),
        SizedBox(height: 04.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Shipping Method',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ],
        ),
        SizedBox(height: 02.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'First Shipment',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ],
        ),
        SizedBox(height: 0.5.h),
        CustomFormField(
          fillColor: AppColors.whiteColor,
          tec: TextEditingController(text: 'Standard'),
          fontSize: 14,
          readOnly: true,
          suffixIcon: Container(
            width: 24,
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: const AppText(
              text: '0.00',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 02.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Requiring Shipment',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ],
        ),
        SizedBox(height: 0.5.h),
        CustomFormField(
          fillColor: AppColors.whiteColor,
          tec: TextEditingController(),
          hint: 'Standard.0.00',
          fontSize: 14,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Please enter standard";
            }
            return null;
          },
        ),
        SizedBox(height: 04.h),
        CustomButton(
          text: 'Continue to Payment',
          onTap: () {
            if (controller.index.value == 2) {
              controller.index.value++;
            }
            controller.update();
          },
          backgroundColor: AppColors.blackColor,
          margin: const EdgeInsets.symmetric(horizontal: 70),
          radios: 05,
          fontSize: 16,
        ),
        SizedBox(height: 02.h),
        CustomButton(
          text: 'Return Information',
          onTap: () {
            if (controller.index.value == 2) {
              controller.index.value--;
            }
            controller.update();
          },
          showArrow: true,
          backgroundColor: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 70),
          fontColor: AppColors.blackColor,
          borderColor:AppColors.blackColor,
          radios: 05,
          fontSize: 16,
        ),
        SizedBox(height: 02.h),
      ],
    );
  }

  _paymentTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _paymentInfoCard(),
        SizedBox(height: 04.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Discount',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ],
        ),
        SizedBox(height: 01.h),
        CustomFormField(
          fillColor: AppColors.whiteColor,
          tec: TextEditingController(text: 'Discount'),
          fontSize: 14,
          readOnly: true,
          suffixIcon: Container(
            width: 24,
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: const AppText(
              text: '0.00',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 02.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Payment',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'All Transaction are secure and encrypted',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.fieldColor,
            ),
          ],
        ),
        SizedBox(height: 01.h),
        Card(
          child: Container(
            height: 53,
            width: double.infinity,
            alignment: Alignment.center,
            child: const AppText(
              text: 'Pressed And Pay',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
        ),
        SizedBox(height: 02.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Billing Address',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ],
        ),
        const SizedBox(height: 05),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Select the address that match the card or\npayment method',
              fontSize: 14,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
              color: AppColors.fieldColor,
            ),
          ],
        ),
        SizedBox(height: 01.h),
        _addressConfirmation(
            title: 'Same as shipping address',
            selected: controller.isSameAddress.value,
            onTap: () {
              controller.isSameAddress.value = true;
              controller.update();
            }),
        SizedBox(height: 01.h),
        _addressConfirmation(
            title: 'Use Different billing address',
            selected: controller.isSameAddress.isFalse,
            onTap: () {
              controller.isSameAddress.value = false;
              controller.update();
            }),
        if (controller.isSameAddress.isFalse) _diffShippingAddress(),
        SizedBox(height: 02.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: AppStrings.lastPaymentMsg,
              fontSize: 14,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
              color: AppColors.fieldColor,
            ),
          ],
        ),
        SizedBox(height: 02.h),
        CustomButton(
          text: 'Pay Now',
          onTap: () {
            Get.back();
          },
          backgroundColor: AppColors.blackColor,
          margin: const EdgeInsets.symmetric(horizontal: 70),
          radios: 05,
        ),
        SizedBox(height: 02.h),
        CustomButton(
          text: 'Return to Shipping',
          onTap: () {
            if (controller.index.value == 3) {
              controller.index.value--;
            }
            controller.update();
          },
          showArrow: true,
          backgroundColor: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 70),
          fontColor: AppColors.blackColor,
          borderColor:AppColors.blackColor,
          radios: 05,
          fontSize: 16,
        ),
        SizedBox(height: 02.h),
      ],
    );
  }

  _shipInfoCard() {
    return Card(
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(16),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Contact',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                AppText(
                  text: 'Change',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  textDecoration: TextDecoration.underline,
                  decorationColor: AppColors.blackColor,
                ),
              ],
            ),
            SizedBox(height: 05),
            AppText(
              text: 'ijaz@gmail.com',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Ship to',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                AppText(
                  text: 'Change',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  textDecoration: TextDecoration.underline,
                  decorationColor: AppColors.blackColor,
                ),
              ],
            ),
            SizedBox(height: 10),
            AppText(
              text: ' new york mid front station',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }

  _paymentInfoCard() {
    return Card(
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Contact',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                AppText(
                  text: 'Change',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  textDecoration: TextDecoration.underline,
                  decorationColor: AppColors.blackColor,
                ),
              ],
            ),
            SizedBox(height: 05),
            AppText(
              text: 'ijaz@gmail.com',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 08),
            Divider(),
            SizedBox(height: 08),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Ship to',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                AppText(
                  text: 'Change',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  textDecoration: TextDecoration.underline,
                  decorationColor: AppColors.blackColor,
                ),
              ],
            ),
            SizedBox(height: 03),
            AppText(
              text: 'new york mid front station',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
            Divider(),
            SizedBox(height: 03),
            AppText(
              text: 'Shipping Method',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            AppText(
              text: 'First Shipment - Standard . 0.00',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
            AppText(
              text: 'new york mid front station',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }

  _addressConfirmation({
    required bool selected,
    Function()? onTap,
    required String title,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.blackColor : AppColors.fieldColor,
            width: selected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            selected
                ? Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: AppColors.blackColor,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.circle_outlined,
                  ),
            const SizedBox(width: 10),
            AppText(
              text: title,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }

  _diffShippingAddress() {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 04.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.blackColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(03),
          topRight: Radius.circular(03),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          LabelFormField(
            tec: TextEditingController(),
            hint: 'First Name',
            fontSize: 14,
            fillColor: AppColors.darkGreyColor,
            borderColor: AppColors.whiteColor,
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
            tec: TextEditingController(),
            hint: 'Last Name',
            fontSize: 14,
            fillColor: AppColors.darkGreyColor,
            borderColor: AppColors.whiteColor,
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
            tec: TextEditingController(),
            hint: 'Phone Number',
            fontSize: 14,
            fillColor: AppColors.darkGreyColor,
            borderColor: AppColors.whiteColor,
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
            tec: TextEditingController(),
            hint: 'Address',
            fontSize: 14,
            fillColor: AppColors.darkGreyColor,
            borderColor: AppColors.whiteColor,
            textInputAction: TextInputAction.done,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter address";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
