import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../path_file.dart';

class PrivacyAndTermsView extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyAndTermsView({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: CustomAppBar(
          marginTop: 30,
          title: title,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 04.h),
        child: Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
