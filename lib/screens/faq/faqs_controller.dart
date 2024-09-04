import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class FaqsController extends BaseController {
  final fireStoreService = FireStoreService();
  List<Map<String, dynamic>> stringList = [];
  List<TextEditingController> controllerList = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getFaqsList();
    super.onInit();
  }

  getFaqsList({search}) async {
    isLoading.value = true;
    stringList = await fireStoreService.getAllFaqs();
    stringList.forEach((action){
      controllerList.add(TextEditingController(text: "write..."));
    });
    isLoading.value = false;
    update();
  }
}
