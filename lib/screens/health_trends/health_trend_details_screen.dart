import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/export.dart';

class HealthTrendDetailsScreen extends StatefulWidget {
  final int? index;

  const HealthTrendDetailsScreen({super.key, this.index});

  @override
  State<HealthTrendDetailsScreen> createState() =>
      _HealthTrendDetailsScreenState();
}

class _HealthTrendDetailsScreenState extends State<HealthTrendDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(
          title: "Health Trends",
          marginTop: 30,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 02.h),
          Expanded(
            child: Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                        child: Container(
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: AppColors.blackColor,
                          ))
                    ],
                  ),
                  const AppText(
                    text: 'Heart Health\nBased on test results',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 02.h),
                  SizedBox(
                    width: size.width,
                    child: Image.asset(
                      AppAssets.healthChrtIcon,
                    ),
                  ),
                  SizedBox(height: 02.h),
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: '91',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: 'Heart Health Score',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 02.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Choose any other organ',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: size.width,
                    child: Divider(
                      height: 1,
                      color: AppColors.blackColor.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: size.width,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: AppColors.blackColor,
                      )),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: 'Liver',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
