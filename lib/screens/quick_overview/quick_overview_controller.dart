import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class QuickOverviewController extends BaseController{

  final fireStoreService = FireStoreService();
  RxBool isLoading = false.obs;
  List<QuickOverview> quickOverViewList=[];

  @override
  void onInit() {
    getQuickOverViewList();
    super.onInit();
  }

  getQuickOverViewList() async {
    isLoading.value = true;
    quickOverViewList = await fireStoreService.getQuickOverViewList();
    isLoading.value = false;
    update();
  }

}