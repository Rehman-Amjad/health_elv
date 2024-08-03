import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class NutrationTips extends StatelessWidget {
  const NutrationTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "Nutritional Tips",
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
                text: 'Nutritional Tips',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: AppText(
                    text: 'Increase intake of\nvegetables',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    softWrap: true,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(AppAssets.leafIcon),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
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
