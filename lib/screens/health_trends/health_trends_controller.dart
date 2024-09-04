import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';


class HealthTrendsController extends BaseController{
  final firestoreService = FireStoreService();
  List<HealthTrends> healthTrendsList = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getHealthTrends();
    super.onInit();
  }

  getHealthTrends() async {
    isLoading.value = true;
    healthTrendsList = await firestoreService.getHealthTrendsList();
    isLoading.value = false;
    update();
  }

}