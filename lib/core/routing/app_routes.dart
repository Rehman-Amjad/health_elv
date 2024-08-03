import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

import '../../screens/faq/export.dart';
import '../../screens/health_trends/export.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      binding: AppBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RoutesName.onBoardingScreen,
      page: () => OnBoardingScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.signupScreen,
      page: () => SignupScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: RoutesName.loginScreen,
      page: () => LoginScreen(),
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
      name: RoutesName.healthOverViewRoute,
      page: () => const HealthOverview(),
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
      name: RoutesName.healthTrendsRoute,
      page: () => const HealthTrends(),
    ),
    GetPage(
      name: RoutesName.healthTrendsResultRoute,
      page: () => const HealthTrendDetailsScreen(),
    ),
    GetPage(
      name: RoutesName.faqRoute,
      page: () => const FaqsView(),
    ),
    GetPage(
      name: RoutesName.accountSettingsRoute,
      page: () => const AccountSettingScreen(),
    ),
  ];
}
