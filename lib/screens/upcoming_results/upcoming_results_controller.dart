import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UpcomingResultsController extends BaseController {
  final fireStoreService = FireStoreService();
  String selectedDate = '';
  final monthController = CalendarController();

  RxBool isLoading = false.obs;
  List<OrderBloodTest> bloodTestList = [];
  List<OrderBloodTest> dotsBloodTestList = [];

  @override
  void onInit() {
    getDotsBloodTests();
    getAllOrderBloodTests(filterDate: DateTime.now());
    super.onInit();
  }

  getAllOrderBloodTests({required DateTime filterDate}) async {
    isLoading = true.obs;
    bloodTestList.clear();
    bloodTestList = await fireStoreService.getAllOrderBloodTests(
      filterDate: filterDate,
    );
    isLoading = false.obs;
    update();
  }

  getDotsBloodTests() async {
    isLoading = true.obs;
    dotsBloodTestList.clear();
    dotsBloodTestList = await fireStoreService.getAllOrderBloodTests();
    isLoading = false.obs;
    update();
  }
}
