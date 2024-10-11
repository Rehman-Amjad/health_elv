import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultsController>(
      initState: (_) {
        Get.put(ResultsController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Health Elev8 Results",
              showArrow: true,
              marginTop: 20,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 02.h),
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
                    child: Text(
                      '${controller.bloodTestResults.length}',
                      style: const TextStyle(
                        color: AppColors.redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              controller.isLoading.isFalse
                  ? ListView.builder(
                      itemCount: controller.bloodTestResults.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return resultItem(controller.bloodTestResults[index]);
                      },
                    )
                  : SizedBox(
                      height: Get.height * 0.5,
                      child: AppUtils.loader(),
                    ),
            ],
          ),
        );
      },
    );
  }

  resultItem(BloodTestResults item) {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: '${item.title}',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    AppText(
                      text: '${item.subTitle}',
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
                AppText(
                  text: AppUtils()
                      .formatDateString(item.testDate!.toDate().toString()),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                CustomButton(
                  text: 'Check Result',
                  width: 130,
                  height: 44,
                  isGradient: true,
                  onTap: () {
                    Get.to(
                      const BloodTestDetailsView(),
                      binding: AppBinding(),
                      arguments: ["BloodTest", item],
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