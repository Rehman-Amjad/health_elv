import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class HealthTrendsView extends GetView<HealthTrendsController> {
  const HealthTrendsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GetBuilder<HealthTrendsController>(
      initState: (_) {
        Get.put(HealthTrendsController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 70),
            child: CustomAppBar(
              title: "Health Trends",
              marginTop: 30,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 04.h),
             controller.isLoading.isFalse? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 3 / 3.1, // Aspect ratio of each card
                ),
                itemCount: controller.healthTrendsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => HealthTrendDetailsView(
                          data: controller.healthTrendsList[index],
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
                            text: controller.healthTrendsList[index].trendName!,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ):Center(
               child: CircularProgressIndicator(
                 color: AppColors.primaryColor,
               ),
             )
            ],
          ),
        );
      },
    );
  }
}
