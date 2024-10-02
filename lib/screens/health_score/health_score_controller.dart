import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class HealthScoreController extends BaseController{

  final firestoreService = FireStoreService();
  HealthScore? healthScore;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getHealthScore();
    super.onInit();
  }

  getHealthScore() async {
    isLoading.value = true;
    healthScore = await firestoreService.getHealthScoreData();
    isLoading.value = false;
    update();
  }
}