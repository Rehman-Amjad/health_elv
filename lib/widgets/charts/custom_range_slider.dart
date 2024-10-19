import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../path_file.dart';

class CustomRangeSlider extends StatelessWidget {
  final String? testUnit;
  final String? status;
  final double currentValue;
  final double normalMinValue;
  final double normalMaxValue;
  final double seekbarValue;

  const CustomRangeSlider({
    super.key,
    this.testUnit,
    this.status,
    required this.currentValue,
    required this.normalMinValue,
    required this.normalMaxValue,
    this.seekbarValue = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Normal Range: $normalMinValue - $normalMaxValue $testUnit',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.fieldColor,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  backgroundColor: getRangeColor(currentValue),
                  text: '$status',
                  width: 74,
                  height: 27,
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(height: 20),
            AppText(
              text: 'Current Score: ${currentValue.toStringAsFixed(1)}',
              color: getRangeColor(currentValue),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 25),
            CustomSeekBar(
              currentValue: currentValue,
              normalMinValue: normalMinValue,
              normalMaxValue: normalMaxValue,
              seekbarValue: seekbarValue,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Low: < $normalMinValue',
                  color: Colors.red,
                  fontSize: 14,
                ),
                AppText(
                  text: 'High: > $normalMaxValue',
                  color: Colors.amber,
                  fontSize: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color getRangeColor(double value) {
    if (value < normalMinValue) {
      return Colors.red;
    } else if (value >= normalMinValue && value <= normalMaxValue) {
      return Colors.green;
    } else {
      return Colors.amber;
    }
  }

  String getTagText(double value) {
    if (value < normalMinValue) {
      return "Low";
    } else if (value >= normalMinValue && value <= normalMaxValue) {
      return "Normal";
    } else {
      return "High";
    }
  }
}
