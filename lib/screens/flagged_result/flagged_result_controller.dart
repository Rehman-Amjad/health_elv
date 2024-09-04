import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class FlaggedResultController extends BaseController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  bool isFromUpComing = Get.arguments[0];

  final firestoreService = FireStoreService();
  BloodTestResults? bloodTestResults;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    if (isFromUpComing) {
      bloodTestResults = Get.arguments[1];
    } else {
      getFlaggedResults();
    }
    initAnimation();
    super.onInit();
  }

  getFlaggedResults() async {
    isLoading.value = true;
    bloodTestResults = await firestoreService.getFlaggedData();
    isLoading.value = false;
    update();
  }

  initAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 9.5).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
