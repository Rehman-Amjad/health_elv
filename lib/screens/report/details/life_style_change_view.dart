import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class LifeStyleChangeView extends StatelessWidget {
  const LifeStyleChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: CustomAppBar(
            title: "Lifestyle Changes",
            marginTop: 20,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            SizedBox(height: 04.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  text: 'Lifestyle Changes',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: LifeStyleCard(
                    width: size.width * 0.45,
                  ),
                ),
                LifeStyleCard(
                  title: '8 Hours\nSleep',
                  imgPath: AppAssets.sleepIcon,
                  width: size.width * 0.45,
                ),
              ],
            ),
            const SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LifeStyleCard(
                    title: 'Regular\nScreening',
                    imgPath: AppAssets.ocrIcon,
                    width: size.width * 0.45,
                  ),
                ),
                LifeStyleCard(
                  title: '15 Minutes\nWalk',
                  imgPath: AppAssets.walkingPersonDIcon,
                  width: size.width * 0.45,
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
        ));
  }
}

class LifeStyleCard extends StatelessWidget {
  final String? imgPath, title;
  final Color? color;
  final double? width, height;

  const LifeStyleCard(
      {super.key,
      this.imgPath,
      this.title,
      this.color,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgPath ?? AppAssets.quitSmokingIcon,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          AppText(
            text: title ?? 'Quite\nSmoking',
            fontSize: 19,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}