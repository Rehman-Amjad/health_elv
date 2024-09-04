import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

import '../../screens/faq/export.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      binding: AppBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RoutesName.signupScreen,
      page: () => const SignupScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.loginScreen,
      page: () => const LoginScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.forgotScreen,
      page: () => const ForgotScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.dashboardBottomNav,
      page: () => const BottomNavScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.orderNewTestRoute,
      page: () => const OrderNewTestView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.reportRoute,
      page: () => const ReportView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.nutrationTipsRoute,
      page: () => const NutrationTips(),
    ),
    GetPage(
      name: RoutesName.healthScoreRoute,
      page: () => const HealthScoreScreen(),
    ),
    GetPage(
      name: RoutesName.faqRoute,
      page: () => const FaqsView(),
    ),
  ];
}
