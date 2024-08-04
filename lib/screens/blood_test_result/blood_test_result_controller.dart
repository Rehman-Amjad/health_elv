import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class BloodTestResultController extends BaseController with GetSingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    initAnimation();
    super.onInit();

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