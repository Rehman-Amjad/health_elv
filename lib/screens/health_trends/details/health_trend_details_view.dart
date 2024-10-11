import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slider/gradient_slider.dart';
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
                  height: 185,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              //text: '${controller.data?.score}',
                              text: 'controller.data?.score',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            SizedBox(height: 10),
                            AppText(
                              // text: '${controller.data?.trendName} Health Score',
                              text: 'controller.data?.trendName} Health Score',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 02.h),
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
                          //value: double.parse(controller.data!.score ?? "0"),
                          value: 500,
                          min: 0,
                          max: 1000,
                          onChanged: (val) {
                            //sliderValue = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            Text(
                              '0',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.fieldColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '1000',
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
