import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      initState: (_) {
        Get.put(ProfileController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: _appBar(),
          body: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              controller.isLoading.isFalse
                  ? SizedBox(
                      width: 126,
                      height: 126,
                      child: ClipOval(
                        child: ImageHelper(
                          image:
                              controller.userData?.imageUrl ?? AppAssets.avatar,
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
              const SizedBox(height: 10),
              AppText(
                text: controller.userData?.fullName ?? "",
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 23),
              const Divider(
                color: AppColors.blackColor,
                height: 2,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ProfileDetailWidget(
                  title: 'Account',
                  imgPath: AppAssets.profileIcon1,
                  onTap: () {
                    Get.to(
                      () => const UserDetailsView(),
                      binding: AppBinding(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: ProfileDetailWidget(
                  title: 'Subscription',
                  imgPath: AppAssets.currencyIcon1,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ProfileDetailWidget(
                  title: 'Term & Condition',
                  isEnableIcon: true,
                  iconData: CupertinoIcons.news,
                  onTap: () {
                    Get.to(
                      () => const PrivacyAndTermsView(
                        title: 'Term & Condition',
                        content: AppStrings.termsAndCondition,
                      ),
                      binding: AppBinding(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ProfileDetailWidget(
                  title: 'Data & Privacy',
                  isEnableIcon: true,
                  iconData: CupertinoIcons.exclamationmark,
                  onTap: () {
                    Get.to(
                      () => const PrivacyAndTermsView(
                        title: 'Data & Privacy',
                        content: AppStrings.termsAndCondition,
                      ),
                      binding: AppBinding(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: ProfileDetailWidget(
                  title: 'Refer a Friend',
                  imgPath: AppAssets.referIcon1,
                ),
              ),
              const SizedBox(height: 25),
              _logout(),
            ],
          ),
        );
      },
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      title: const AppText(
        text: 'Profile',
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
    );
  }

  _logout() {
    return GestureDetector(
      onTap: () {
        controller.firebase.signOut().then((onValue) {
          controller.saveBool(SharePrefKeys.isUserLoggedIn, false);
          Get.offAllNamed(
            RoutesName.loginScreen,
          );
        });
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: AppUtils.linearDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout,
              size: 25,
              color: AppColors.whiteColor,
            ),
            SizedBox(width: 10),
            AppText(
              text: 'Logout',
              fontSize: 20,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailWidget extends StatelessWidget {
  final String title;
  final String? imgPath;
  final VoidCallback? onTap;
  final IconData? iconData;

  final bool isEnableIcon,isEnableText;

  const ProfileDetailWidget(
      {super.key,
      required this.title,
      this.onTap,
      this.imgPath,
      this.iconData,
      this.isEnableIcon = false,
      this.isEnableText = false,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(5),
                decoration: AppUtils.linearDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                child: isEnableIcon
                    ? Icon(
                        iconData,
                        color: Colors.white,
                      )
                    : isEnableText ? 
                AppText(text: "AED")
                 :SvgPicture.asset(
                        imgPath ?? '',
                        color: AppColors.whiteColor,
                      ),
              ),
              AppText(
                text: title,
                fontSize: 20,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Container(
            width: 30,
            height: 30,
            decoration: AppUtils.linearDecoration(
              borderRadius: BorderRadius.circular(30),
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
