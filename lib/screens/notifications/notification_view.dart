import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(initState: (_) {
      Get.put(NotificationController());
    }, builder: (context) {
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 70),
          child: CustomAppBar(
            title: "Notifications",
            marginTop: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: controller.notificationsList.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.notificationsList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return NotificationCard();
                  },
                )
              : const Center(
                  child: AppText(
                    text: "No Notifications",
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      );
    });
  }
}
