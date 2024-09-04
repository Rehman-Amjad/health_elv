import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../path_file.dart';

class HomeController extends BaseController with GetSingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> animation;

  final firebase = FirebaseAuth.instance;
  final fireStoreService = FireStoreService();
  UserData? userData;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    initAnimation();
    getProfileInfo();
    super.onInit();

  }

   initAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 0.75).animate(_animationController)
      ..addListener(() {
       update();
      });
    _animationController.forward();
  }

  getProfileInfo() async {
    isLoading.value = true;
    userData = await fireStoreService.getUserData(
      firebase.currentUser?.uid,
    );
    isLoading.value = false;
    update();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

}