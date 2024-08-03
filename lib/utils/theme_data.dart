import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle healthElevFont = GoogleFonts.montserrat();
final appTheme = ThemeData(
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.whiteColor,
  ),
  scaffoldBackgroundColor: AppColors.lightWhiteBg,
);
