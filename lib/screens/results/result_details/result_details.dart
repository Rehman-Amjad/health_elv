import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slider/gradient_slider.dart';

import '../../../path_file.dart';

class ResultDetails extends GetView<ResultsController> {
  const ResultDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultsController>(
      initState: (_) {
        Get.put(ResultsController());
      },
      builder: (context) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Health Elev8 Check up",
              marginTop: 20,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    const BioMarkerResultView(),
                    transition: Transition.upToDown,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: Card(
                  color: AppColors.whiteColor,
                  child: Container(
                    height: 185,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Fasting Blood Glucose',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Normal',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ],
                        ),
                        GradientSlider(
                          thumbAsset: AppAssets.icBloodSugarIndicator,
                          thumbHeight: 14,
                          thumbWidth: 02,
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
                              value: 8.5,
                              min: 0,
                              max: 10,
                              onChanged: (val) {
                                //sliderValue = val;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '70',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              const SizedBox(width: 70),
                              Text(
                                '100',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
