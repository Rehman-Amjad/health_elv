import 'package:get/get.dart';
import '../../../path_file.dart';

class HealthTrendDetailsController extends BaseController{

  String trendCategory=Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(trendCategory);
  }

}