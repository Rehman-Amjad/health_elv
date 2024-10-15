import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class TestSubCategoryController extends BaseController {
  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();

  List<String> testSubCategoriesList = [];
  String testCategory = Get.arguments;

  @override
  void onInit() {
    testSubCategories();
    super.onInit();
  }

  Future<void> testSubCategories() async {
    isLoading.value = true;
    testSubCategoriesList = await fireStoreService.getTestSubCategoryLists(
      title: testCategory,
    );
    debugPrint('Test Subcategories: $testSubCategoriesList');
    isLoading.value = false;
    update();
  }
}
