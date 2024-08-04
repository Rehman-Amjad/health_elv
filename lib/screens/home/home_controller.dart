import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../path_file.dart';

class HomeController extends BaseController with GetSingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    initAnimation();
    super.onInit();

  }

   initAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 0.95).animate(_animationController)
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