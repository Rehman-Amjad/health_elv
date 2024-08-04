import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/core/service/cache_manager.dart';
import 'package:sizer/sizer.dart';

import '../../path_file.dart';

class QuestionAirView extends StatefulWidget {
  const QuestionAirView({super.key});

  @override
  _QuestionAirViewState createState() => _QuestionAirViewState();
}

class _QuestionAirViewState extends State<QuestionAirView> with CacheManager {
  String exerciseFrequency = 'Weekly';
  String exerciseType = 'Training';
  String consumeHabits = 'Both';
  List<String> healthGoals = [
    'Manage blood sugar',
    'Reduce Weight',
    'Reduce stress'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: Text(
          'Health Survey',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _buildSystemTile('How often do you exercise?'),
          const SizedBox(height: 10),
          _buildCheckboxGroup(
            options: [
              'Daily',
              'Weekly',
              'Occasionally',
              'Rarely',
              'Never',
            ],
            left: 30.w,
          ),
          const SizedBox(height: 10),
          _buildUserTile('Weekly'),
          const SizedBox(height: 20),
          _buildSystemTile(
              'What type of exercise do you engage in? (e.g., cardio, strength training, yoga)'),
          const SizedBox(height: 10),
          _buildCheckboxGroup(
            options: [
              'cardio',
              'strength',
              'training',
              'yoga',
            ],
            left: 30.w,
          ),
          const SizedBox(height: 10),
          _buildUserTile('Training'),
          const SizedBox(height: 20),
          _buildSystemTile('Do you smoke or consume alcohol?'),
          const SizedBox(height: 10),
          _buildCheckboxGroup(
            options: [
              'Smoke',
              'Alcohol',
              'Both',
            ],
            left: 32.w,
          ),
          const SizedBox(height: 10),
          _buildUserTile('Both'),
          const SizedBox(height: 20),
          _buildSystemTile(
              'What are your primary health goals based on your recent blood test results?'),
          const SizedBox(height: 20),
          _buildCheckboxGroup(
            options: [
              'Improve cholesterol levels',
              'Manage blood sugar',
              'Increase energy levels',
              'Reduce Weight',
              'Gain Weight',
              'Enhance sleep quality',
              'Reduce stress',
              'Other (please specify)'
            ],
            left: 15.w,
          ),
          const SizedBox(height: 10),
          _buildUserTile(' Manage blood sugar\nReduce Weight\nReduce Stress'),
          const SizedBox(height: 20),
          CustomButton(
            text: "Submit",
            radios: 06,
            onTap: () {
              _showResults();
            },
          ),
          SizedBox(height: 04.h),
        ],
      ),
    );
  }

  _buildSystemTile(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.blackColor,
              )),
          child: ClipOval(
            child: ImageHelper(
              image: AppAssets.logoImage,
              imageType: ImageType.asset,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 15.w),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
          ),
        )
      ],
    );
  }

  _buildUserTile(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 40.w),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              textAlign: TextAlign.start,
              text,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 42,
          height: 42,
          padding: EdgeInsets.all(05),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.blackColor,
              )),
          child: ImageHelper(
            image: AppAssets.profileIcon1,
            imageType: ImageType.svg,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxGroup({
    required List<String> options,
    required double left,
  }) {
    return Container(
      margin: EdgeInsets.only(left: left, right: 10.w),
      padding: const EdgeInsets.all(05),
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: options.map((option) {
          return CheckboxListTile(
            checkColor: AppColors.whiteColor,
            activeColor: AppColors.blackColor,
            title: Text(
              option,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
            value: healthGoals.contains(option),
            onChanged: (bool? value) {
              setState(() {
                if (value!) {
                  healthGoals.add(option);
                } else {
                  healthGoals.remove(option);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Answers'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Exercise Frequency: $exerciseFrequency'),
                const SizedBox(height: 10),
                Text('Exercise Type: $exerciseType'),
                const SizedBox(height: 10),
                Text('Smoke or Consume Alcohol: $consumeHabits'),
                const SizedBox(height: 10),
                Text('Health Goals: ${healthGoals.join(', ')}'),
              ],
            ),
          ),
          actions: [
            CustomButton(
              text: "Continue",
              radios: 06,
              onTap: () {
                saveBool(SharePrefKeys.isQuestionAir, true);
                Get.offAllNamed(RoutesName.dashboardBottomNav);
              },
            ),
          ],
        );
      },
    );
  }
}
