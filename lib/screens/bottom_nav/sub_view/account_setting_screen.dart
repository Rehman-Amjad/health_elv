import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';


class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const AppText(
          text: 'Account Setting', fontSize: 24, fontWeight: FontWeight.bold,),
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ImageHelper(
              image: AppAssets.backIcon,
              imageType: ImageType.svg,
            ),
          ),
          onTap: () => Get.back(),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               Row(
                 children: [
                   Container(
                     padding: const EdgeInsets.all(5),
                     decoration: const BoxDecoration(
                         color: AppColors.blackColor,
                         shape: BoxShape.circle
                     ),
                     margin: EdgeInsets.only(right: 20),
                     alignment: Alignment.center,
                     child: Icon(Icons.settings,color: AppColors.whiteColor,),
                   ),
                   AppText(text: 'App Setting',fontSize: 24,fontWeight: FontWeight.w600,)
                 ],
               ),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      color: AppColors.blackColor,
                      shape: BoxShape.circle
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.whiteColor,size: 18,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
