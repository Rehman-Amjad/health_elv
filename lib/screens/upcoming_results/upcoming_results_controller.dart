import 'package:health_elev8_app/path_file.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UpcomingResultsController extends BaseController{

  String selectedDate = '';
  final monthController = CalendarController();
  DateTime tempDate = DateTime.now();

}