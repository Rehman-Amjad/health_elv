import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slider/gradient_slider.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import 'export.dart';

class FlaggedResultView extends GetView<FlaggedResultController> {
  const FlaggedResultView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GetBuilder<FlaggedResultController>(
      initState: (_) {
        Get.put(FlaggedResultController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Blood Test Result",
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
                          '${controller.bloodTestResults?.title}',
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
                    Card(
                      color: AppColors.whiteColor,
                      child: Container(
                        height: 185,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Normal Range: ${controller.bloodTestResults?.normalRange} units${controller.bloodTestResults?.testUnit}',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.fieldColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      CustomButton(
                                        backgroundColor: AppColors.redColor,
                                        text:
                                            '${controller.bloodTestResults?.status}',
                                        width: 74,
                                        height: 27,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${controller.bloodTestResults?.currentRange} ${controller.bloodTestResults?.testUnit}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            GradientSlider(
                              thumbAsset: AppAssets.icThumb,
                              thumbHeight: 24,
                              thumbWidth: 24,
                              trackHeight: 10,
                              trackBorder: 0,
                              trackBorderColor: Colors.white,
                              activeTrackGradient: const LinearGradient(
                                colors: [
                                  Color(0xFFC5B630),
                                  Color(0xFF9FC042),
                                  Color(0xFF6EB86D),
                                  Color(0xFF31B736),
                                  Color(0xFFAB6938),
                                  Color(0xFFE30505),
                                ],
                              ),
                              inactiveTrackGradient: LinearGradient(
                                colors: [
                                  AppColors.fieldColor.withOpacity(0.3),
                                  AppColors.fieldColor.withOpacity(0.3),
                                ],
                              ),
                              inactiveTrackColor: Colors.black,
                              slider: Slider(
                                value: controller.animation.value,
                                min: 0,
                                max: 100,
                                onChanged: (val) {
                                  //sliderValue = val;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Low',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.fieldColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'High',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.fieldColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                      '${controller.bloodTestResults?.testDesc}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'What might a normal result mean?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${controller.bloodTestResults?.highMeanDate}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'What might a high result mean?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${controller.bloodTestResults?.lowMeanDate}',
                      style: const TextStyle(fontSize: 16),
                    ),
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
