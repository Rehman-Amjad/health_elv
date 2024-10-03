import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/export.dart';
import 'export.dart';

getCustomDropDownTitle({title, required Widget child}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${title}',
        style: GoogleFonts.poppins(
          color: AppColors.blackColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 10),
      child,
    ],
  );
}

CustomDropdownDecoration? decoration({headerFontSize,prefixIcon,bolderColor,fillColor}) => CustomDropdownDecoration(
      closedFillColor: fillColor?? AppColors.whiteColor,
      expandedFillColor: AppColors.whiteColor,
      closedBorder: Border.all(color: bolderColor?? AppColors.blackColor),
      expandedBorder: Border.all(color: bolderColor ?? AppColors.blackColor),
      prefixIcon: prefixIcon,
      closedSuffixIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.blackColor,
      ),
      expandedSuffixIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: AppColors.blackColor,
      ),
      hintStyle: GoogleFonts.poppins(
        color: AppColors.fontColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headerStyle: GoogleFonts.poppins(
        color: AppColors.blackColor,
        fontSize: headerFontSize ?? 16,
        fontWeight: FontWeight.w500,
      ),
      listItemStyle: GoogleFonts.poppins(
        color: AppColors.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      listItemDecoration: ListItemDecoration(
        selectedColor: AppColors.fontColor1,
        highlightColor: Colors.grey[800],
      ),
    );

CustomDropdownDecoration? searchDecoration() => CustomDropdownDecoration(
      closedFillColor: AppColors.fontColor1,
      expandedFillColor: AppColors.whiteColor,
      closedSuffixIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.blackColor,
      ),
      expandedSuffixIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: AppColors.blackColor,
      ),
      searchFieldDecoration: SearchFieldDecoration(
        fillColor: Colors.grey[700],
        prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
        hintStyle: GoogleFonts.poppins(
          color: AppColors.fontColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        textStyle: GoogleFonts.poppins(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        suffixIcon: (onClear) {
          return GestureDetector(
            onTap: onClear,
            child: Icon(Icons.close, color: Colors.grey[400]),
          );
        },
      ),
      listItemDecoration: ListItemDecoration(
        selectedColor: AppColors.fontColor,
        highlightColor: Colors.grey[800],
      ),
    );
