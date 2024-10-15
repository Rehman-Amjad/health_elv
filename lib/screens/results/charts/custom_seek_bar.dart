import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSeekBar extends StatelessWidget {
  final double currentValue;

  const CustomSeekBar({
    super.key,
    required this.currentValue,
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
            ),
          ),
          child: Slider(
            value: currentValue,
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final double showValue;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.showValue,
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

    Color thumbColor;
    if (showValue <= 33) {
      thumbColor = Colors.red;
    } else if (showValue <= 66) {
      thumbColor = Colors.green;
    } else {
      thumbColor = Colors.yellow;
    }

    // Draw the thumb with the selected color
    final Paint thumbPaint = Paint()
      ..color = thumbColor;
    canvas.drawCircle(center, thumbRadius, thumbPaint);


    // Draw the value tooltip above the thumb
    final TextSpan span = new TextSpan(
      style: GoogleFonts.poppins(
        fontSize: thumbRadius * 0.8,
        fontWeight: FontWeight.w700,
        color: thumbColor,
      ),
      text: '${showValue.toInt()}',
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
      ..color = thumbColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(tooltipRect, borderPaint);

    // Draw the value text inside the tooltip
    tp.paint(canvas, tooltipOffset);
  }
}
