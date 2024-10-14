import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class TestTypeController extends BaseController {
  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();

  List<String> testTypeList = [];

  @override
  void onInit() {
    testTypes();
    super.onInit();
  }

  Future<void> testTypes() async {
    isLoading.value = true;
    final bloodTestResults = await fireStoreService.getBloodDropDownLists();
    testTypeList = bloodTestResults['testTypes'] ?? [];
    debugPrint('Test Types: $testTypeList');
    isLoading.value = false;
    update();
  }
}
