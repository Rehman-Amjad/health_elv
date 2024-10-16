import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../path_file.dart';

class CustomSeekBar extends StatelessWidget {
  final double currentValue;
  final double normalMinValue;
  final double normalMaxValue;

  const CustomSeekBar({
    super.key,
    required this.currentValue,
    required this.normalMinValue,
    required this.normalMaxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              // Red portion (0% to 33%)
              Expanded(
                flex: 33,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              // Green portion (33% to 66%)
              Expanded(
                flex: 33,
                child: Container(
                  color: Colors.green,
                ),
              ),
              // Yellow portion (66% to 100%)
              Expanded(
                flex: 34,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Slider widget on top
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.transparent,
            inactiveTrackColor: Colors.transparent,
            thumbShape: CustomSliderThumbCircle(
              thumbRadius: 12,
              showValue: currentValue,
              normalMinValue: normalMinValue,
              normalMaxValue: normalMaxValue,
            ),
          ),
          child: Slider(
            value: checkCurrentValue(),
            min: 0,
            max: 500,
            divisions: 500,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  double checkCurrentValue() {
    // 31.5  < 34.1
    if (normalMinValue  < currentValue) {
      //34.5 > 34.1
      if (normalMaxValue  > currentValue) {
        return 333.0 + currentValue;
      } else {
        return 165.0 + currentValue;
      }
    } else {
      return currentValue;
    }
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final double showValue;
  final double normalMinValue;
  final double normalMaxValue;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.showValue,
    required this.normalMinValue,
    required this.normalMaxValue,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Draw the vertical line for the thumb
    final Paint thumbPaint = Paint()
      ..color =
          AppColors.blackColor // You can use AppColors.blackColor if needed
      ..strokeWidth = 05; // Width of the line
    canvas.drawLine(
      Offset(center.dx, center.dy - thumbRadius), // Start point
      Offset(center.dx, center.dy + thumbRadius), // End point
      thumbPaint,
    );

    // Draw the value tooltip above the thumb
    final TextSpan span = new TextSpan(
      style: GoogleFonts.poppins(
        fontSize: thumbRadius * 0.8,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      text: '$showValue',
    );

    final TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );

    tp.layout();
    Offset tooltipOffset = Offset(
        center.dx - tp.width / 2, center.dy - thumbRadius * 2 - tp.height);

    // Draw tooltip background with border
    final Rect tooltipRect = Rect.fromLTWH(
      tooltipOffset.dx - 3,
      tooltipOffset.dy - 2.5,
      tp.width + 07,
      tp.height + 05,
    );

    // Tooltip background
    final Paint tooltipPaint = Paint()..color = Colors.white;
    canvas.drawRect(tooltipRect, tooltipPaint);

    // Tooltip border
    final Paint borderPaint = Paint()
      ..color = AppColors.blackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(tooltipRect, borderPaint);

    // Draw the value text inside the tooltip
    tp.paint(canvas, tooltipOffset);
  }
}
