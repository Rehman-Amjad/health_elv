import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class HealthTrendDetailsView extends GetView<HealthTrendDetailsController> {
  const HealthTrendDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthTrendDetailsController>(
      initState: (_) {
        Get.put(HealthTrendDetailsController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 70),
            child: CustomAppBar(
              title: "Health Trends Details",
              marginTop: 30,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            children: [
              SizedBox(height: 02.h),
              Card(
                color: AppColors.whiteColor,
                child: Container(
                  height: 300,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: controller.trendCategory,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 02.h),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.only(left: 16),
                        child: controller.isLoading.isFalse
                            ? HealthTrendsChart(
                                healthTrendsList: controller.healthTrendsList,
                              )
                            : AppUtils.loader(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 02.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.info),
                  SizedBox(width: 10),
                  AppText(
                    text: 'Trends Score Based On Users Reviews',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
