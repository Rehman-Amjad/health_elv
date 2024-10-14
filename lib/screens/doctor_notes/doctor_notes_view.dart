import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class DoctorNotesView extends GetView<DoctorNotesController> {
  const DoctorNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorNotesController>(
      initState: (_) {
        Get.put(DoctorNotesController());
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 70),
            child: CustomAppBar(
              title: 'Doctor Notes',
              marginTop: 30,
            ),
          ),
          body: controller.isLoading.isFalse
              ? controller.quickOverViewList.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.quickOverViewList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 16,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AppText(
                                  text:
                                      "${controller.quickOverViewList[index].overView?.capitalize}",
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
                        );
                      },
                    )
                  : const Center(
                      child: AppText(
                        text: "No Relevant Data were found",
                      ),
                    )
              : AppUtils.loader(),
        );
      },
    );
  }
}
