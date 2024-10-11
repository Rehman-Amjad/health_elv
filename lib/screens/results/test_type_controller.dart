import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class TestTypeController extends BaseController {

  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();

  List<TestTypeModel> testTypeList = [];
  String testType = "";

  @override
  void onInit() {
    getTestsTypeDropDown();
    super.onInit();
  }


  getTestsTypeDropDown() async {
    isLoading = true.obs;
    testTypeList = await fireStoreService.getTestTypes();
    isLoading = false.obs;
    update();
  }
}
