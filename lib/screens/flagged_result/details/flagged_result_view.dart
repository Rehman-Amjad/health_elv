import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import '../export.dart';

class FlaggedResultView extends GetView<FlaggedResultController> {
  const FlaggedResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlaggedResultController>(
      initState: (_) {
        Get.put(FlaggedResultController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Flagged Result",
              marginTop: 20,
            ),
          ),
          body: controller.isLoading.isFalse
              ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SizedBox(height: 02.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.bloodTestResults?.title ?? "",
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Parameter Result',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomRangeSlider(
                      testUnit: controller.bloodTestResults?.testUnit,
                      status: controller.bloodTestResults?.status,
                      currentValue: double.parse(
                          controller.bloodTestResults?.currentRange ?? "0"),
                      normalMinValue: double.parse(
                          controller.bloodTestResults?.minRange ?? "0"),
                      normalMaxValue: double.parse(
                          controller.bloodTestResults?.maxRange ?? "0"),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.bloodTestResults?.testDesc ?? "",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
        );
      },
    );
  }
}
