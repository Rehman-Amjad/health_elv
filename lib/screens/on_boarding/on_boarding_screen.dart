import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final obController = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
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
                    controller: obController.pageController,
                    onPageChanged: (int page) {
                      obController.onPageChanged(page);
                    },
                    itemCount: obController.pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: obController.pages[index].title,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 50.h,
                            width: MediaQuery.sizeOf(context).width,
                            child: ImageHelper(
                              alignment: Alignment.center,
                              image: obController.pages[index].image,
                              imageType: ImageType.asset,
                              boxFit: BoxFit.contain,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                _getStartedButton(),
              ],
            );
          },
        ),
      ),
    );
  }

  _pagerDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        obController.pages.length,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                obController.pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: (obController.activePage.value == index)
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

  _getStartedButton() {
    return CustomButton(
      radios: 30,
      width: 70.w,
      text: AppStrings.getStarted,
      onTap: () {
        Get.offAllNamed(RoutesName.loginScreen);
        obController.doneOnBoarding();
      },
    );
  }
}
