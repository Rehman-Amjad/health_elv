import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class FlaggedListingController extends BaseController {
  final firestoreService = FireStoreService();
  List<BloodTestResults> bloodTestResults=[];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getFlaggedListingResults();
    super.onInit();
  }


  getFlaggedListingResults() async {
    isLoading.value = true;
    bloodTestResults = await firestoreService.getFlaggedTestResults();
    isLoading.value = false;
    update();
  }


  @override
  void dispose() {
    super.dispose();
  }
}
