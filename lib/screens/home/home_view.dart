import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import '../flagged_result/export.dart';
import '../health_score/export.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (_) {
        Get.put(HomeController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.fieldColor.withOpacity(0.01),
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 153),
            child: _appBar(),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 06),
            children: [
              SizedBox(height: 02.h),
              _healthCard(),
              SizedBox(height: 02.h),
              _quickSummary(),
              SizedBox(height: 02.h),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 01.h),
                    HealthCardWidget(
                      title: 'Blood Test Results',
                      imgPath: AppAssets.icBloodTest,
                      onTap: () {
                        Get.to(
                          () => const ResultsView(fromNew: true),
                          binding: AppBinding(),
                        );
                      },
                    ),
                    HealthCardWidget(
                      title: 'Upcoming Tests',
                      imgPath: AppAssets.upcommingBloodTestIcon,
                      onTap: () {
                        Get.to(
                          () => UpcomingResultsView(),
                          binding: AppBinding(),
                        );
                      },
                    ),
                    HealthCardWidget(
                      title: 'Health Trends',
                      imgPath: AppAssets.trendsIcon,
                      scale: 0.8,
                      onTap: () {
                        Get.to(
                          () => const HealthTrendsView(),
                          binding: AppBinding(),
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                    FaqWidget(
                      title: 'Book A Test',
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: AppColors.whiteColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.0),
                            ),
                          ),
                          builder: (context) {
                            return _addNewTest(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                    FaqWidget(
                      title: 'FAQs',
                      onTap: () {
                        Get.toNamed(RoutesName.faqRoute);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _appBar() {
    return Container(
      width: Get.width,
      height: 153,
      padding: const EdgeInsets.only(left: 10, top: 30),
      decoration: AppUtils.linearDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(06),
          bottomRight: Radius.circular(06),
        ),
      ),
      child: Row(
        children: [
          controller.isLoading.isFalse
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageHelper(
                        image:
                            controller.userData?.imageUrl ?? AppAssets.avatar,
                        imageType: controller.userData?.imageUrl != null
                            ? ImageType.network
                            : ImageType.asset,
                        boxFit: BoxFit.contain,
                        imageShape: ImageShape.rectangle,
                        width: 56,
                        height: 56,
                      ),
                    ),
                    SizedBox(width: 1.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: controller.userData?.fullName ?? "",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ],
                )
              : AppUtils.loader(),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const NotificationView(),
                binding: AppBinding(),
                transition: Transition.upToDown,
                duration: const Duration(milliseconds: 500),
              );
            },
            child: Container(
              width: Get.width * 0.14,
              height: Get.height * 0.06,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppAssets.whiteBellIcon,
              ),
            ),
          )
        ],
      ),
    );
  }

  _healthCard() {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => HealthScoreScreen(),
          binding: AppBinding(),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.treeIcon),
                  const AppText(
                    text: 'Health Score',
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _quickSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: SvgPicture.asset(
                          AppAssets.walkingPersonDIcon,
                          color: AppColors.primaryColor,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: CustomButton(
                      text: 'Quick Overview',
                      fontSize: 16,
                      height: 60,
                      width: 200.0,
                      radios: 06,
                      isGradient: true,
                      backgroundColor: AppColors.primaryColor,
                      onTap: () {
                        Get.to(
                          () => const HealthOverview(),
                          binding: AppBinding(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: CustomButton(
                      text: 'Flagged Results',
                      fontSize: 16,
                      height: 60,
                      width: 200.0,
                      radios: 06,
                      isGradient: true,
                      onTap: () {
                        Get.to(
                          () => const FlaggedResultView(),
                          binding: AppBinding(),
                          arguments: [
                            false,
                          ]
                        );
                      },
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _addNewTest(context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Option',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.clear_circled),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(height: 02.h),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageHelper(
              image: AppAssets.icAddBlood,
              imageType: ImageType.asset,
            ),
            title: Text(
              'Order New Blood Test',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(RoutesName.orderNewTestRoute);
            },
          ),
          SizedBox(height: 04.h),
        ],
      ),
    );
  }
}

class FaqWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const FaqWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: AppText(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: onTap,
      ),
    );
  }
}

class HealthCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title, imgPath;
  double? scale;

  HealthCardWidget({
    super.key,
    this.onTap,
    this.title,
    this.imgPath,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 02, vertical: 10),
          child: ListTile(
            onTap: onTap,
            leading: Container(
              width: 60,
              height: 64,
              alignment: Alignment.center,
              decoration: AppUtils.linearDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: imgPath!.contains('.png')
                  ? Image.asset(
                      imgPath!,
                      scale: scale ?? 1.5,
                    )
                  : SvgPicture.asset(
                      imgPath ?? AppAssets.bloodTestR,
                      color: AppColors.whiteColor,
                    ),
            ),
            title: AppText(
              text: title ?? 'Blood Test Results',
              fontSize: 16,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
