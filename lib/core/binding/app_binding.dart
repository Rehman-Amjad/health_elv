import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

import '../../screens/blood_test_result/export.dart';
import '../../screens/faq/export.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => OnBoardingController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ForgotController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => BottomNavController());

    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => HealthOverviewController());
    Get.lazyPut(() => FaqsController());
    Get.lazyPut(() => OrderNewTestController());

    Get.lazyPut(() => ResultsController());
    Get.lazyPut(() => BloodTestResultController());
    Get.lazyPut(() => UpcomingResultsController());


    Get.lazyPut(() => ReportController());
    Get.lazyPut(() => BloodTestResultController());


    Get.lazyPut(() => ProfileController());
  }
}
