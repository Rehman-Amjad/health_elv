import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

import '../export.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const AppText(
            text: 'Recommendations',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: 'Based on your health ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: ListView(shrinkWrap: true, children: [
                ReportCardWidget(
                  imgPath: AppAssets.reportPlusIcon,
                  onTap: () {
                    Get.toNamed(RoutesName.nutrationTipsRoute);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReportCardWidget(
                    imgPath: AppAssets.reportPlusIcon2,
                    title: 'Lifestyle Changes',
                    subTitle: 'Keep you healthy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LifeStyleChangeView(),
                        ),
                      );
                    },
                  ),
                ),
                ReportCardWidget(
                  imgPath: AppAssets.pillIcon,
                  title: 'Vitamins',
                  subTitle: 'For good healthy life',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VitamansView(),
                      ),
                    );
                  },
                ),
              ]))
            ],
          ),
        ));
  }
}

class ReportCardWidget extends StatelessWidget {
  final String? title, subTitle, imgPath;
  final VoidCallback? onTap;

  const ReportCardWidget(
      {super.key, this.title, this.subTitle, this.imgPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: size.height * 0.11,
        decoration: BoxDecoration(
          color: AppColors.darkBlueColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: size.height,
              width: size.width * 0.2,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.darkBlueLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(imgPath ?? ''),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title ?? 'Nutritional Tips',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
                AppText(
                  text: subTitle ?? 'Tips for your health',
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
