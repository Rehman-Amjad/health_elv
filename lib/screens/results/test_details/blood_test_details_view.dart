import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class BloodTestDetailsView extends GetView<BloodTestDetailsController> {
  const BloodTestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BloodTestDetailsController>(
      initState: (_) {
        Get.put(BloodTestDetailsController());
      },
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: CustomAppBar(
              title: '${controller.item.title}',
              marginTop: 20,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 02.h),
              getTabs(),
              const SizedBox(height: 8),
              if (controller.selectedTab.value == "Current")
                _getCurrentTab()
              else
                _getComparisonTab(),
            ],
          ),
        );
      },
    );
  }

  getTabs() {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 05),
      decoration: BoxDecoration(
          color: const Color(0xFFE9E6E6),
          borderRadius: BorderRadius.circular(05)),
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
        CustomRangeSlider(
          testUnit: controller.item.testUnit,
          status: controller.item.status,
          currentValue: tooDouble(controller.item.currentRange),
          normalMinValue: tooDouble(controller.item.minRange),
          normalMaxValue: tooDouble(controller.item.maxRange),
          seekbarValue: tooDouble(controller.item.seekbarValue),
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
          controller.item.testDesc!,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  _getComparisonTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Text(
          'Last Results',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: AppColors.whiteColor,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView.builder(
                      itemCount: controller.comparisonList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        BloodTestResults item =
                            controller.comparisonList[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Test No${index + 1}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.fieldColor,
                                ),
                              ),
                              const SizedBox(height: 03),
                              Text(
                                formatDate(item.testDate!.toDate()),
                                //'02/01/2024',
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
                CustomLineChart(testResults: controller.comparisonList),
                const SizedBox(height: 06),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView.builder(
                      itemCount: controller.comparisonList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        BloodTestResults item =
                            controller.comparisonList[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.currentRange}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.fieldColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }
}
