import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class TestSubCategoryController extends BaseController {

  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();

  List<TestSubCategoryModel> testTypeList = [];
  String testCategory=Get.arguments;

  @override
  void onInit() {
    getTestsTypeDropDown();
    super.onInit();
  }


  getTestsTypeDropDown() async {
    isLoading = true.obs;
    testTypeList = await fireStoreService.getTestSubCategory(testCategory: testCategory);
    isLoading = false.obs;
    update();
  }
}
