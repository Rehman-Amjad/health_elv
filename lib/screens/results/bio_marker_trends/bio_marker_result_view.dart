import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slider/gradient_slider.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class BioMarkerResultView extends GetView<ResultsController> {
  const BioMarkerResultView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GetBuilder<ResultsController>(initState: (_) {
      Get.put(ResultsController());
    }, builder: (_) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: CustomAppBar(
            title: "Biomarker Trends",
            marginTop: 20,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 02.h),
            Expanded(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: AppColors.darkGreyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    Container(
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fasting Blood Sugar\nGlucose',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    getTabs(),
                    const SizedBox(height: 8),
                    if (controller.selectedTab.value == "Current")
                      _getCurrentTab()
                    else
                      _getComparisonTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  getTabs() {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 05),
      decoration:  BoxDecoration(
        color: const Color(0xFFE9E6E6),
        borderRadius: BorderRadius.circular(05)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomButton(
                text: "Current",
                radios: 05,
                fontSize: 16,
                onTap: () {
                  controller.selectedTab.value = "Current";
                  controller.update();
                },
                backgroundColor: controller.selectedTab.value == "Current"
                    ? AppColors.blackColor
                    : Colors.transparent,
                fontColor: controller.selectedTab.value == "Current"
                    ? AppColors.whiteColor
                    : AppColors.blackColor),
          ),
          Expanded(
            flex: 1,
            child: CustomButton(
              text: "Comparison",
              radios: 05,
              fontSize: 16,
              onTap: () {
                controller.selectedTab.value = "Comparison";
                controller.update();
              },
              backgroundColor: controller.selectedTab.value == "Comparison"
                  ? AppColors.blackColor
                  : Colors.transparent,
              fontColor: controller.selectedTab.value == "Comparison"
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  _getCurrentTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Normal Range: 140-280 units/L',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.fieldColor,
                            ),
                          ),
                          const Spacer(),
                          const CustomButton(
                            backgroundColor: AppColors.redColor,
                            text: 'High',
                            width: 74,
                            height: 27,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '400 U/L',
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
                      value: 9.5,
                      min: 0,
                      max: 10,
                      onChanged: (val) {
                        //sliderValue = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
        const Text(
          'LDH (Lactate Dehydrogenase) is an enzyme found in many body tissues. A blood test measures its level to assess potential cell or tissue damage. Normal LDH levels vary slightly based on age and lab, but typically range from 140 to 280 units per liter (U/L) for adults.',
          style: TextStyle(fontSize: 16),
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
        const Text(
          "While reassuring, a normal LDH doesn't necessarily rule out all potential tissue damage. Your doctor might recommend additional tests based on your symptoms and medical history.",
          style: TextStyle(fontSize: 16),
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
        const Text(
          "High LDH (above normal range): This can indicate damage to various tissues, including muscles, liver, kidneys, red blood cells, or the heart. It's important to note that a high LDH alone doesn't pinpoint the source of the damage. Further tests are needed for diagnosis.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  _getComparisonTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            // height: 185,
            padding: const EdgeInsets.symmetric(vertical: 24),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Normal Range:  70-100 mg/dL',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.fieldColor,
                    ),
                  ),
                ),
                const SizedBox(height: 02),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              Text(
                                'No ${index+1}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.fieldColor,
                                ),
                              ),
                              const SizedBox(height: 03),
                              Text(
                                '02/01/2024',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.fieldColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                CustomLineChart(),
                const SizedBox(height: 06),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${160}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fieldColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${200}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fieldColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${150}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fieldColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${250}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fieldColor,
                          ),
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
        const Text(
          'LDH (Lactate Dehydrogenase) is an enzyme found in many body tissues. A blood test measures its level to assess potential cell or tissue damage. Normal LDH levels vary slightly based on age and lab, but typically range from 140 to 280 units per liter (U/L) for adults.',
          style: TextStyle(fontSize: 16),
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
        const Text(
          "While reassuring, a normal LDH doesn't necessarily rule out all potential tissue damage. Your doctor might recommend additional tests based on your symptoms and medical history.",
          style: TextStyle(fontSize: 16),
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
        const Text(
          "High LDH (above normal range): This can indicate damage to various tissues, including muscles, liver, kidneys, red blood cells, or the heart. It's important to note that a high LDH alone doesn't pinpoint the source of the damage. Further tests are needed for diagnosis.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
