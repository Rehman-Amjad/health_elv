import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

import '../../screens/faq/export.dart';
import '../../screens/flagged_result/export.dart';

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
    Get.lazyPut(() => FlaggedResultController());
    Get.lazyPut(() => UpcomingResultsController());


    Get.lazyPut(() => ReportController());


    Get.lazyPut(() => ProfileController());
  }
}
