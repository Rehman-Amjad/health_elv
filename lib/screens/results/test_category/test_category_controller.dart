import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class TestCategoryController extends BaseController {

  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();

  List<TestCategoryModel> testTypeList = [];
  String testType=Get.arguments;

  @override
  void onInit() {
    getTestsTypeDropDown();
    super.onInit();
  }


  getTestsTypeDropDown() async {
    isLoading = true.obs;
    testTypeList = await fireStoreService.getTestCategory(testType: testType);
    isLoading = false.obs;
    update();
  }
}
