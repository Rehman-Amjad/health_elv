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
      title: "Book your Doctor any time any where",
    ),
    OnBoardingModel(
      image: AppAssets.introTwo,
      title: "Blood Sample Test any Time any Where",
    ),
    OnBoardingModel(
      image: AppAssets.introThree,
      title: "Blood Sample Test any Time any Where",
    ),
  ].obs;

  void doneOnBoarding() {
    isOnBoardingDone.value = true;
    saveBool(SharePrefKeys.onBoarding, true);
  }
}
