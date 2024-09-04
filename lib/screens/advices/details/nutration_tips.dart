import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

class NutrationTips extends StatelessWidget {
  final String description;

  const NutrationTips({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "Advice Details",
          marginTop: 20,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: 04.h),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AppText(
              text: description,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              softWrap: true,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
