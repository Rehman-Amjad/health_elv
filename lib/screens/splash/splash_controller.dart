import 'package:get/get.dart';
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
    //final isQuestionAir = await getBool(SharePrefKeys.isQuestionAir);
    await Future.delayed(const Duration(seconds: 2));
    if (onBoardingStatus == null) {
      Get.offAll(
            () =>  const OnBoardingScreen(),
        binding: AppBinding(),
      );
    } else if (isUserLoggedIn == true) {
      Get.offAll(
        () => const BottomNavScreen(),
        binding: AppBinding(),
      );
    } else {
      Get.offAllNamed(RoutesName.loginScreen);
    }
  }
}
