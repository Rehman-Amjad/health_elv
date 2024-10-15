import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class TestCategoryController extends BaseController {
  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();

  List<String> testCategoriesList = [];
  String testType = Get.arguments;

  @override
  void onInit() {
    testCategories();
    super.onInit();
  }

  Future<void> testCategories() async {
    isLoading.value = true;
    testCategoriesList = await fireStoreService.getTestCategoryLists(
      testType: testType,
    );
    debugPrint('Test Categories: $testCategoriesList');
    isLoading.value = false;
    update();
  }
}
