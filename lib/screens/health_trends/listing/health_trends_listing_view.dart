import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class HealthTrendsListingView extends GetView<HealthTrendsController> {
  final String? title;

  const HealthTrendsListingView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GetBuilder<HealthTrendsController>(
      initState: (_) {
        Get.put(HealthTrendsController());
        controller.getHealthTrends(trendCategory: title);
      },
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 70),
            child: CustomAppBar(
              title: title!,
              marginTop: 30,
            ),
          ),
          body: controller.isLoading.isFalse
              ? controller.healthTrendsList.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  text: controller
                                      .healthTrendsList[index].trendName!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  :  const Center(
                      child: AppText(
                        text: "No Relevant data were found",
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
}
