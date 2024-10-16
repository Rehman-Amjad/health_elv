import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/charts/test.dart';

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
          body: controller.isLoading.isFalse
              ? ListView.builder(
                  itemCount: controller.bloodTestResults.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 02.h,
                  ),
                  itemBuilder: (context, index) {
                    return resultItem(controller.bloodTestResults[index]);
                  },
                )
              : SizedBox(
                  height: Get.height * 0.5,
                  child: AppUtils.loader(),
                ),
        );
      },
    );
  }

  resultItem(BloodTestResults item) {
    return Card(
      child: Container(
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
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: '${item.title}',
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w800,
                      ),
                      AppText(
                        text: '${item.subTitle}',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
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
                      //const BloodTestSeekBar(),
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
