import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:health_elev8_app/screens/health_trends/listing/health_trends_listing_view.dart';

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
          body: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.getCategoryList().length,
                  itemBuilder: (context, index) {
                    CategoryModel item = controller.getCategoryList()[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => HealthTrendsListingView(
                            title: item.title,
                          ),
                        );
                      },
                      child: SizedBox(
                        width: size.width * 0.3,
                        child: Card(
                          elevation: 4,
                          child: Center(
                            child: Row(
                              children: [
                                ImageHelper(
                                  image: item.image!,
                                  imageType: ImageType.asset,
                                  height: 80,
                                  width: 80,
                                ),
                                AppText(
                                  text: item.title!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
