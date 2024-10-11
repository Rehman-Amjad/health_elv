import 'package:get/get.dart';

import '../../../path_file.dart';

class HealthTrendDetailsController extends BaseController {
  final firestoreService = FireStoreService();
  List<HealthTrends> healthTrendsList = [];
  RxBool isLoading = false.obs;
  String trendCategory = Get.arguments;

  @override
  void onInit() {
    getHealthTrends();
    super.onInit();
  }

  getHealthTrends() async {
    isLoading.value = true;
    healthTrendsList = await firestoreService.getHealthTrendsList(
      trendCategory: trendCategory,
    );
    isLoading.value = false;
    print(healthTrendsList.length);
    update();
  }
}
