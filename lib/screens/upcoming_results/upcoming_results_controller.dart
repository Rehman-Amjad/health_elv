import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UpcomingResultsController extends BaseController{
  final fireStoreService = FireStoreService();
  String selectedDate = '';
  final monthController = CalendarController();
  DateTime tempDate = DateTime.now();

  RxBool isLoading = false.obs;
  List<OrderBloodTest> bloodTestList = [];

  @override
  void onInit() {
    getAllOrderBloodTests();
    super.onInit();
  }

  getAllOrderBloodTests({search}) async {
    bloodTestList.clear();
    isLoading = true.obs;
    bloodTestList = await fireStoreService.getAllOrderBloodTests();
    isLoading = false.obs;
    update();
  }



}