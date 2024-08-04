import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import '../blood_test_result/export.dart';

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
              const Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: 'Health Hub',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  )),
              SizedBox(height: 01.h),
              HealthCardWidget(
                title: 'Blood Test Results',
                subtitle: 'Recently TSH',
                imgPath: AppAssets.icBloodTest,
                onTap: () {
                  Get.to(()=>
                    const ResultsView(fromNew: true),
                    binding: AppBinding(),
                  );
                },
              ),
               HealthCardWidget(
                title: 'Upcoming Blood Test',
                subtitle: 'Check your calendar',
                imgPath: AppAssets.upcommingBloodTestIcon,
                onTap: (){
                  Get.to(()=>
                     UpcomingResultsView(),
                    binding: AppBinding(),
                  );
                },
              ),
              HealthCardWidget(
                title: 'Health ',
                subtitle: 'Trends for biomarkers',
                imgPath: AppAssets.homeUpCommingBldTestIcon,
                onTap: () {
                  Get.toNamed(RoutesName.healthTrendsRoute);
                },
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: 'Others',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              FaqWidget(
                title: 'FAQs',
                onTap: () {
                  Get.toNamed(RoutesName.faqRoute);
                },
              ),
              const SizedBox(height: 5),
              FaqWidget(
                title: 'Order new test',
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
      padding: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(06),
          bottomRight: Radius.circular(06),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ImageHelper(
               image: AppAssets.femaleDoctorImg,
              imageType: ImageType.asset,
              boxFit: BoxFit.cover,
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
              const AppText(
                text: 'Alexa',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.greenAddIcon,
                  ),
                  AppText(
                    text: ' %75',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greenColor,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Container(
            width: Get.width * 0.14,
            height: Get.height * 0.06,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppAssets.whiteBellIcon,
            ),
          )
        ],
      ),
    );
  }

  _healthCard() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesName.healthScoreRoute);
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
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: controller.animation.value,
                      strokeWidth: 16,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    '${(controller.progress * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
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
          child: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesName.healthOverViewRoute);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                            width: 25,
                            height: 25,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                            child: AppText(
                          text: 'Quick\nHealth\nOverview',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xff5D6A85),
                          softWrap: true,
                          textAlign: TextAlign.start,
                        )),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const AppText(
                      text: 'For quick summary',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff090E1D),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CustomButton(
                        text: 'Click Here',
                        onTap: () {
                          Get.toNamed(RoutesName.healthOverViewRoute);
                        },
                        backgroundColor: AppColors.primaryColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: 'Area of concern',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff090E1D),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CustomButton(
                      text: 'Flagged Results',
                      onTap: () {
                        Get.to(()=>
                          const BloodTestResultView(),
                          binding: AppBinding(),
                        );
                      },
                      backgroundColor: AppColors.primaryColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
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
  final String? title, subtitle, imgPath;

  const HealthCardWidget({
    super.key,
    this.onTap,
    this.title,
    this.imgPath,
    this.subtitle,
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: AppColors.primaryColor,
              ),
              child: imgPath!.contains('.png')
                  ? Image.asset(
                      imgPath!,
                      scale: 1.5,
                    )
                  : SvgPicture.asset(
                      imgPath ?? AppAssets.bloodTestR,
                      color: AppColors.whiteColor,
                    ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title ?? 'Blood Test Results',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: subtitle ?? 'Recently TSH',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
