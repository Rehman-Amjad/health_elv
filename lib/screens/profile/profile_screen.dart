import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:health_elev8_app/screens/profile/profile_controller.dart';
import 'package:sizer/sizer.dart';

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
                    image: '',
                    imageType: ImageType.network,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const AppText(
                text: 'Alex ',
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 33),
              const Divider(
                color: AppColors.blackColor,
                height: 2,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(height: 42),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: ProfileDetailWidget(
                  title: 'User Details',
                  imgPath: AppAssets.profileIcon1,
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ProfileDetailWidget(
                  title: 'Account Setting',
                  isEnableIcon: true,
                  iconData: Icons.settings,
                  onTap: () {
                    Get.toNamed(RoutesName.accountSettingsRoute);
                  },
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: ProfileDetailWidget(
                  title: 'Refer as Friend',
                  imgPath: AppAssets.referIcon1,
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: ProfileDetailWidget(
                  title: 'Subscription',
                  imgPath: AppAssets.currencyIcon1,
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
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
        )
      ],
    );
  }

  _logout() {
    return GestureDetector(
      onTap: () {
        controller.firebase.signOut().then((onValue) {
          controller.clearPref();
          Get.offAllNamed(
            RoutesName.loginScreen,
          );
        });
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: AppColors.blackColor,
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

  final bool isEnableIcon;

  const ProfileDetailWidget(
      {super.key,
      required this.title,
      this.onTap,
      this.imgPath,
      this.iconData,
      this.isEnableIcon = false});

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
              isEnableIcon
                  ? Icon(
                      iconData,
                      color: Colors.grey,
                    )
                  : SvgPicture.asset(imgPath ?? ''),
              SizedBox(width: 2.h),
              AppText(
                text: title,
                fontSize: 20,
                color: AppColors.fieldColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blackColor,
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
