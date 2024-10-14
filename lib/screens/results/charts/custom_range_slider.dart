import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../path_file.dart';

class CustomRangeSlider extends StatelessWidget {
  final String? testUnit;
  final String? status;
  final double currentValue;
  final double normalMinValue;
  final double normalMaxValue;

  const CustomRangeSlider({
    super.key,
    this.testUnit,
    this.status,
    required this.currentValue,
    required this.normalMinValue,
    required this.normalMaxValue,
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
            const SizedBox(height: 50),
            _priceSlider(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Low: < $normalMinValue',
                  color: Colors.red,
                  fontSize: 12,
                ),
                AppText(
                  text: 'Current Score: ${currentValue.toStringAsFixed(1)}',
                  color: getRangeColor(currentValue),
                  fontSize: 12,
                ),
                AppText(
                  text: 'High: > $normalMaxValue',
                  color: Colors.amber,
                  fontSize: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _priceSlider() {
    return Column(
      children: [
        SfSliderTheme(
          data: SfRangeSliderThemeData(
            tooltipBackgroundColor: AppColors.whiteColor,
            tooltipTextStyle: GoogleFonts.sora(
              color: AppColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            activeTrackHeight: 12,
            inactiveTrackHeight: 8,
            activeLabelStyle: GoogleFonts.sora(
              color: AppColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            inactiveLabelStyle: GoogleFonts.sora(
              color: AppColors.greyColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: SfRangeSlider(
            min: 0,
            max: 500,
            enableTooltip: true,
            shouldAlwaysShowTooltip: true,
            activeColor: getRangeColor(currentValue),
            inactiveColor: AppColors.greyColor.withOpacity(0.5),
            onChanged: (dynamic value) {},
            values: SfRangeValues(
              normalMinValue,
              normalMaxValue,
            ),
          ),
        ),
      ],
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
