import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:health_elev8_app/utils/theme_data.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: AppStrings.appName,
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          initialRoute: RoutesName.splashScreen,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
