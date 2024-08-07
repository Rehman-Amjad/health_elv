import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class HealthTrendsView extends GetView<HealthTrendsController> {
  const HealthTrendsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GetBuilder<HealthTrendsController>(initState: (_) {
      Get.put(HealthTrendsController());
    }, builder: (_) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 70),
          child: CustomAppBar(
            title: "Health Trends",
            marginTop: 30,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            SizedBox(height: 04.h),
            const AppText(
              text: 'Choose Organ System\nto check Health Level',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 04.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  text: 'Choose Date',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 01.h),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                ).then((value) {
                  if (value != null) {
                    String date = value.toString().split(' ')[0];
                    controller.selectedDate = date;
                    controller.update();
                    debugPrint('--> date: $date');
                  }
                });
              },
              child: Container(
                width: size.width,
                height: 50,
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
                          ? 'Choose Date for Tests'
                          : controller.selectedDate,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
            ),
            SizedBox(height: 04.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 3 / 3.1, // Aspect ratio of each card
              ),
              itemCount: controller.stringList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => HealthTrendDetailsView(
                        data: controller.stringList[index],
                      ),
                    );
                  },
                  child: SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.15,
                    child: Card(
                      elevation: 4,
                      child: Center(
                        child: AppText(
                          text: controller.stringList[index],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }
}
