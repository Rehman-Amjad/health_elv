import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ResultsView extends GetView<ResultsController> {
  final bool fromNew;

  const ResultsView({
    super.key,
    this.fromNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultsController>(
      initState: (_) {
        Get.put(ResultsController());
      },
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Health Elev8 Check up",
              showArrow: fromNew,
              marginTop: 20,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 04.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'My Blood Tests ',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: AppColors.redColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(06)),
                    alignment: Alignment.center,
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 03.h),
              getFilterButtons(context),
              const SizedBox(height: 16),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return resultItem();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  getFilterButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              controller.isShowFirst.value = true;
              controller.selectedDate = "";
              controller.update();
            },
            child: Container(
              width: Get.width,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                color: controller.isShowFirst.isTrue
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
                border: Border.all(
                  color: AppColors.blackColor,
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  AppText(
                text: 'Show Latest First',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: controller.isShowFirst.isTrue
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              DatePickerBdaya.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1900, 3, 5),
                maxTime: DateTime(2500, 3, 5),
                onChanged: (date) {
                  debugPrint('change $date');
                },
                onConfirm: (DateTime date) {
                  String selectedDate =
                      DateFormat('dd, MMM, yyyy').format(date);
                  controller.selectedDate = selectedDate;
                  controller.isShowFirst.value = false;
                  controller.update();
                },
                currentTime: DateTime.now(),
              );
            },
            child: Container(
              width: Get.width,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                  border: Border.all(
                color: AppColors.blackColor,
              )),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: controller.selectedDate == ''
                        ? 'Calendar'
                        : controller.selectedDate,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  resultItem() {
    return Card(
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: AppColors.primaryColor.withOpacity(0.80),
                  ),
                  child: ImageHelper(
                    image: AppAssets.icTestTube,
                    imageType: ImageType.asset,
                    color: AppColors.whiteColor,
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Elev8 Essential",
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    AppText(
                      text: "For Cardiovascular Function Test",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(
                  text: "26 June 2024 - 4 PM",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                CustomButton(
                  text: 'Check Result',
                  width: 130,
                  height: 44,
                  isGradient: true,
                  onTap: () {
                    controller.selectedTab='Current'.obs;
                    Get.to(
                      const BioMarkerResultView(),
                      binding: AppBinding(),
                    );
                  },
                  backgroundColor: AppColors.blackColor,
                  fontSize: 13,
                  radios: 05,
                  showSuffix: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
