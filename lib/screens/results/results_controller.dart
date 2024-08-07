import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:health_elev8_app/path_file.dart';

class ResultsController extends BaseController{

  String selectedDate = '';
  RxBool isShowFirst=true.obs;
  RxString selectedTab='Current'.obs;

}