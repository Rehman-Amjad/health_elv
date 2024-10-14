import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class FaqsController extends BaseController {
  final fireStoreService = FireStoreService();
  List<Map<String, dynamic>> stringList = [];
  RxBool isLoading = false.obs;

  RxBool isExpand = false.obs;

  @override
  void onInit() {
    getFaqsList();
    super.onInit();
  }

  getFaqsList({search}) async {
    isLoading.value = true;
    stringList = await fireStoreService.getAllFaqs();
    isLoading.value = false;
    update();
  }
}
