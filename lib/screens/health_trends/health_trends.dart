import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import 'export.dart';

class HealthTrends extends StatefulWidget {
  const HealthTrends({super.key});

  @override
  State<HealthTrends> createState() => _HealthTrendsState();
}

class _HealthTrendsState extends State<HealthTrends> {
  String selectedDate = '';
  List stringList = [
    'Thyroid\nProfile',
    'Liver\nProfile',
    'Hear\nHealth',
    'Lipid\nProfile',
    'Cardiac\nMarkers',
    'Hormone\nLevel'
  ];

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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: 10,
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
                  const AppText(
                    text: 'Choose Organ System\nto check Health Level',
                    fontSize: 24,
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
                          selectedDate = date;
                          setState(() {});
                          debugPrint('--> date: $date');
                        }
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: size.height * 0.05,
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
                            text: selectedDate == ''
                                ? 'Choose Date for Tests'
                                : selectedDate,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 3 / 3.1, // Aspect ratio of each card
                    ),
                    itemCount: stringList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => HealthTrendDetailsScreen(
                              index: index,
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
                                text: stringList[index],
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
            ),
          )
        ],
      ),
    );
  }
}
