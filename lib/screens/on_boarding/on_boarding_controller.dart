import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/utils/share_pref_keys.dart';
import 'package:health_elev8_app/core/service/cache_manager.dart';
import 'package:health_elev8_app/path_file.dart';

class OnBoardingController extends BaseController with CacheManager {
  final pageController = PageController(initialPage: 0);
  RxInt activePage = 0.obs;
  RxBool isOnBoardingDone = false.obs;

  onPageChanged(int page) {
    activePage.value = page;
  }

  final List<OnBoardingModel> pages = [
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
  ];

  void doneOnBoarding() {
    isOnBoardingDone.value = true;
    saveBool(SharePrefKeys.onBoarding, true);
  }
}
