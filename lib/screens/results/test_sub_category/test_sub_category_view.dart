import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class TestSubCategoryView extends GetView<TestSubCategoryController> {
  const TestSubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestSubCategoryController>(
      initState: (_) {
        Get.put(TestSubCategoryController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Test Sub Categories",
              showArrow: true,
              marginTop: 20,
            ),
          ),
          body: controller.isLoading.isFalse
              ? ListView.builder(
                  itemCount: controller.testSubCategoriesList.length,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return testTypeItem(
                        controller.testSubCategoriesList[index]);
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

  testTypeItem(String item) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const ResultsView(),
          arguments: item,
          transition: Transition.circularReveal,
          duration: const Duration(milliseconds: 500),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: AppColors.primaryColor.withOpacity(0.80),
                    ),
                    child: ImageHelper(
                      image: AppAssets.icTestTube,
                      imageType: ImageType.asset,
                      color: AppColors.whiteColor,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  AppText(
                    text: item,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.blackColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
