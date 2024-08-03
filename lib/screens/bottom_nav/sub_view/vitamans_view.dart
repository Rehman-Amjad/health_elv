import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:health_elev8_app/widgets/custom_button.dart';

import '../export.dart';

class VitamansView extends StatelessWidget {
  const VitamansView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const AppText(
          text: 'Vitamins',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
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
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const AppText(
              text: 'Vitamins and Supplements',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LifeStyleCard(
                    width: size.width * 0.45,
                    title: 'Daily\nRetinol',
                    imgPath: AppAssets.pillIcon,
                    color: AppColors.secondryColor,
                  ),
                ),
                LifeStyleCard(
                  width: size.width * 0.45,
                  title: 'Daily\nVit C',
                  imgPath: AppAssets.sleepIcon,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: CustomButton(
                text: 'Learn more',
                onTap: () {},
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
