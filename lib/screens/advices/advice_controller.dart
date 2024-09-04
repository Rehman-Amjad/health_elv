import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class AdviceController extends BaseController{
  final firestoreService = FireStoreService();
  List<AdviceModel> adviceList = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAdvices();
    super.onInit();
  }

  getAdvices() async {
    isLoading.value = true;
    adviceList = await firestoreService.getAdviceList();
    isLoading.value = false;
    update();
  }

}