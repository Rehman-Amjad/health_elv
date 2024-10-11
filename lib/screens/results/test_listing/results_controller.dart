import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class ResultsController extends BaseController {
  final fireStoreService = FireStoreService();

  RxBool isLoading = false.obs;
  List<BloodTestResults> bloodTestResults = [];
  String testSubCategory = Get.arguments;

  @override
  void onInit() {
    getBloodTestResults();
    super.onInit();
  }

  getBloodTestResults() async {
    isLoading.value = true;
    print(testSubCategory);
    bloodTestResults = await fireStoreService.getBloodTestResults(
      testSubCategory: testSubCategory,
    );
    isLoading.value = false;
    update();
  }
}
