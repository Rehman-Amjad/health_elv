import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class HealthTrendDetailsView extends StatefulWidget {
  final String? data;

  const HealthTrendDetailsView({super.key, this.data});

  @override
  State<HealthTrendDetailsView> createState() => _HealthTrendDetailsViewState();
}

class _HealthTrendDetailsViewState extends State<HealthTrendDetailsView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(
          title: "Health Trends Details",
          marginTop: 30,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        children: [
          SizedBox(height: 02.h),
          AppText(
            text: '${widget.data?.replaceAll("\n", " ")}',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
          SizedBox(height: 02.h),
          SizedBox(
            width: size.width,
            child: Image.asset(
              AppAssets.healthChrtIcon,
            ),
          ),
          SizedBox(height: 02.h),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: '91',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                AppText(
                  text: 'Heart Health Score',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ),
          SizedBox(height: 02.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                text: 'Choose any other organ',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: size.width,
            child: Divider(
              height: 1,
              color: AppColors.blackColor.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  border: Border.all(
                color: AppColors.blackColor,
              )),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Liver',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
