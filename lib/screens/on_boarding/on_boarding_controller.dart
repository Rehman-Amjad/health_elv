import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class OnBoardingController extends BaseController with CacheManager {
  final pageController = PageController(initialPage: 0);
  RxInt activePage = 0.obs;
  RxBool isOnBoardingDone = false.obs;

  onPageChanged(int page) {
    activePage.value = page;
  }

  final RxList<OnBoardingModel> pages = <OnBoardingModel>[
    OnBoardingModel(
      image: AppAssets.introOne,
      title: "DHA Certified Blood Tests",
    ),
    OnBoardingModel(
      image: AppAssets.introTwo,
      title: "Detailed Analysis & Trends",
    ),
    OnBoardingModel(
      image: AppAssets.introThree,
      title: "Custom Health Coach Guidance",
    ),
  ].obs;

  void doneOnBoarding() {
    isOnBoardingDone.value = true;
    saveBool(SharePrefKeys.onBoarding, true);
  }
}
