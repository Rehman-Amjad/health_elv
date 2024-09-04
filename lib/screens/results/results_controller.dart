import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class ResultsController extends BaseController {
  String selectedDate = '';
  RxBool isShowFirst = true.obs;

  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();
  List<BloodTestResults> bloodTestResults = [];

  @override
  void onInit() {
    getBloodTestResults();
    super.onInit();
  }

  getBloodTestResults() async {
    isLoading.value = true;
    bloodTestResults = await fireStoreService.getBloodTestResults();
    isLoading.value = false;
    update();
  }
}
