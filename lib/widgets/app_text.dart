import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool softWrap;
  final Color color;
  final TextDecoration textDecoration;

  const AppText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color = AppColors.blackColor,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.fontSize = 12,
    this.softWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      style: GoogleFonts.inter(
        decoration: textDecoration,
        decorationColor: AppColors.whiteColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
