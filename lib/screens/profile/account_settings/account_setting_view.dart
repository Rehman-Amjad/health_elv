import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class AccountSettingView extends StatelessWidget {
  const AccountSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(
          marginTop: 30,
          title: 'Account Settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            SizedBox(height: 08.h),
            _itemSettings(
              title: 'App Settings',
              icon: Icons.settings,
              onTap: () {},
            ),
            SizedBox(height: 03.h),
            _itemSettings(
              title: 'Term and Condition ',
              icon: CupertinoIcons.news,
              onTap: () {
                Get.to(
                  () => const PrivacyAndTermsView(
                    title: 'Term and Condition',
                    content: AppStrings.termsAndCondition,
                  ),
                  binding: AppBinding(),
                  transition: Transition.upToDown,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
            SizedBox(height: 03.h),
            _itemSettings(
              title: 'Data and Privacy',
              icon: CupertinoIcons.exclamationmark,
              onTap: () {
                Get.to(
                  () => const PrivacyAndTermsView(
                    title: 'Data and Privacy',
                    content: AppStrings.termsAndCondition,
                  ),
                  binding: AppBinding(),
                  transition: Transition.upToDown,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _itemSettings({title, icon, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColors.blackColor,
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: AppColors.whiteColor,
                  size: 16,
                ),
              ),
              AppText(
                text: title,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: AppColors.blackColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.whiteColor,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
