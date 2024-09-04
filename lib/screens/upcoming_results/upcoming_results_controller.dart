import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UpcomingResultsController extends BaseController{

  String selectedDate = '';
  final monthController = CalendarController();
  DateTime tempDate = DateTime.now();

  RxBool isLoading = false.obs;
  final fireStoreService = FireStoreService();
  List<BloodTestResults> bloodTestResults = [];

  @override
  void onInit() {
    getBloodTestResults();
    super.onInit();
  }

  getBloodTestResults({DateTime? selectedDate}) async {
    isLoading.value = true;
    bloodTestResults = await fireStoreService.getBloodTestResults(
      selectedDate: selectedDate,
    );
    isLoading.value = false;
    update();
  }

}