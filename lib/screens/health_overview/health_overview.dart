import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class HealthOverview extends GetView<HealthOverviewController> {
  const HealthOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthOverviewController>(
      initState: (_) {
        Get.put(HealthOverviewController());
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
            itemCount: controller.stringsList.length,
            itemExtent: 50,
            shrinkWrap: true,
            padding: const EdgeInsets.all(14.0),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.doubleTickIcon,
                  ),
                  const SizedBox(width: 20),
                  AppText(
                    text: controller.stringsList[index],
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: AppColors.fieldColor2,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
