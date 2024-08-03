import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';


class VitaminsView extends StatelessWidget {
  const VitaminsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "Vitamins",
          marginTop: 20,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 04.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                text: 'Vitamins and Supplements',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ],
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
    );
  }
}
