import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slider/gradient_slider.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import '../export.dart';

class FlaggedListingView extends GetView<FlaggedListingController> {
  const FlaggedListingView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GetBuilder<FlaggedListingController>(
      initState: (_) {
        Get.put(FlaggedListingController());
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
                  text: AppUtils().formatDateString(item.testDate!.toDate().toString()),
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
                      const BioMarkerResultView(),
                      binding: AppBinding(),
                      arguments: item,
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
