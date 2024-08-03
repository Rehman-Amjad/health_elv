import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class HealthScoreScreen extends StatefulWidget {
  const HealthScoreScreen({super.key});

  @override
  State<HealthScoreScreen> createState() => _HealthScoreScreenState();
}

class _HealthScoreScreenState extends State<HealthScoreScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(
              top: size.height * 0.08,
              left: 20,
              right: 20,
            ),
            margin: EdgeInsets.only(
              bottom: size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: ImageHelper(
                        image: AppAssets.backIcon,
                        imageType: ImageType.asset,
                        color: AppColors.whiteColor,
                        scale: 2.5,
                      ),
                      onTap: () => Get.back(),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 4,
                        right: 4,
                        top: 2,
                        bottom: 2,
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColors.secondryColor),
                      alignment: Alignment.center,
                      child: const AppText(
                        text: 'Normal',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                    )
                  ],
                ),
                const Center(
                  child: AppText(
                    text: '75',
                    fontWeight: FontWeight.w700,
                    fontSize: 100,
                    color: AppColors.whiteColor,
                  ),
                ),
                const Center(
                    child: AppText(
                  text: 'You are a healthy individual',
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                )),
                SizedBox(
                  height: size.height * 0.02,
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 06),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      text: 'sleep',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(AppAssets.sleepIcon),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                CustomBarChart(),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: '68',
                      color: AppColors.whiteColor,
                      fontSize: 30,
                    ),
                    AppText(
                      text: 'hours',
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
