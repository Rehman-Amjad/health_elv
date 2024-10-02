import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.whiteColor,
              child: Obx(
                () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 10.h),
                      _pagerDots(),
                      Expanded(
                        child: PageView.builder(
                          controller: controller.pageController,
                          onPageChanged: (int page) {
                            controller.onPageChanged(page);
                          },
                          itemCount: controller.pages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  text: controller.pages[controller.activePage.value].title,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 50.h,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: ImageHelper(
                                    alignment: Alignment.center,
                                    image: controller.pages[controller.activePage.value].image,
                                    imageType: ImageType.asset,
                                    boxFit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Obx(
                        () => controller.activePage.value == 2
                            ? _getStartedButton()
                            : _getNextButton(),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      }
    );
  }

  _pagerDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        controller.pages.length,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                controller.pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: (controller.activePage.value == index)
                      ? AppColors.blackColor
                      : AppColors.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getNextButton() {
    return CustomButton(
      radios: 30,
      width: 70.w,
      isGradient: true,
      text: AppStrings.next,
      onTap: () {
        controller.activePage.value++;
        controller.onPageChanged(controller.activePage.value);
        controller.update();
      },
    );
  }

  _getStartedButton() {
    return CustomButton(
      radios: 30,
      width: 70.w,
      isGradient: true,
      text: AppStrings.getStarted,
      onTap: () {
        Get.offAllNamed(RoutesName.loginScreen);
        controller.doneOnBoarding();
      },
    );
  }
}
