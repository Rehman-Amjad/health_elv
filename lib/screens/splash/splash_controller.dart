import 'package:get/get.dart';
import 'package:health_elev8_app/core/data/shared_pref/share_pref_keys.dart';
import 'package:health_elev8_app/core/service/cache_manager.dart';
import 'package:health_elev8_app/path_file.dart';

class SplashController extends BaseController with CacheManager {
  @override
  void onInit() {
    getOnBoardingStatus();
    super.onInit();
  }
  Future<void> getOnBoardingStatus() async {
    final onBoardingStatus = await getBool(SharePrefKeys.onBoarding);
    final isUserLoggedIn = await getBool(SharePrefKeys.isUserLoggedIn);
    await Future.delayed(const Duration(seconds: 2));
    if (onBoardingStatus == null) {
      Get.offAllNamed(RoutesName.onBoardingScreen);
    } else if (isUserLoggedIn == true) {
      Get.offAllNamed(RoutesName.dashboardBottomNav);
    } else {
      Get.offAllNamed(RoutesName.loginScreen);
    }
  }

}
