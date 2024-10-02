import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

import 'export.dart';

class QuickOverviewView extends GetView<QuickOverviewController> {
  const QuickOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuickOverviewController>(
      initState: (_) {
        Get.put(QuickOverviewController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 70),
            child: CustomAppBar(
              title: 'Health Overview',
              marginTop: 30,
            ),
          ),
          body: ListView.builder(
            itemCount: controller.quickOverViewList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: 05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.doubleTickIcon,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AppText(
                          text: "${controller.quickOverViewList[index].overView}",
                          fontSize: 17,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          fontWeight: FontWeight.w600,
                          color: AppColors.fieldColor2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 05),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
