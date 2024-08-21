import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      initState: (_) {
        Get.put(ReportController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Health Coach Advice",
              showArrow: false,
              marginTop: 20,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: 'Based on your results ',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      _getReportCardWidget(
                        imgPath: AppAssets.reportPlusIcon,
                        onTap: () {
                          Get.toNamed(RoutesName.nutrationTipsRoute);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _getReportCardWidget(
                          imgPath: AppAssets.reportPlusIcon2,
                          title: 'Lifestyle Advice',
                          subTitle: '',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LifeStyleChangeView(),
                              ),
                            );
                          },
                        ),
                      ),
                      _getReportCardWidget(
                        imgPath: AppAssets.pillIcon,
                        title: 'Supplement Advice',
                        subTitle: '',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VitaminsView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _getReportCardWidget({
    final String? title,
    final String? subTitle,
    final String? imgPath,
    final VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: Get.height * 0.11,
        // decoration: BoxDecoration(
        //   color: AppColors.darkBlueColor,
        //   borderRadius: BorderRadius.circular(16),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.5),
        //       spreadRadius: 1,
        //       blurRadius: 7,
        //       offset: const Offset(0, 3), // changes position of shadow
        //     ),
        //   ],
        // ),
        decoration: AppUtils.linearDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: Get.height,
              width: Get.width * 0.2,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.80),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(imgPath ?? ''),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title ?? 'Nutritional Advice',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
                AppText(
                  text: subTitle ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
