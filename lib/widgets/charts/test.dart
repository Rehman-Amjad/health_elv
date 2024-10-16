import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';

class BloodTestSeekBar extends StatefulWidget {
  const BloodTestSeekBar({super.key});

  @override
  _BloodTestSeekBarState createState() => _BloodTestSeekBarState();
}

class _BloodTestSeekBarState extends State<BloodTestSeekBar> {

  ///min formula
  //min = 20;
  //165 - 20;
  //145
  //min normal range => 20 + 145

  ///max formula
  //max = 120;
  //333 - 120
  // 213
  //max normal range 120 + 213

  ///current formula
  //current = 170;
  // 165 + 170
  // current range 145


  double showValue = 10;
  double _currentValue = 165 + 170; // Current range value
  final double _normalRangeMin = 20 + 145; // Normal min range
  final double _normalRangeMax = 120 + 213; // Normal max range
  final double _sliderMin = 0; // Min range for slider (0)
  final double _sliderMax = 500; // Max range for slider (500)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blood Test Results")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background sections for the slider
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    // Red section (Low range)
                    Expanded(
                      flex: (_normalRangeMin / _sliderMax * 100).toInt(), // Portion for red
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    // Green section (Normal range)
                    Expanded(
                      flex: ((_normalRangeMax - _normalRangeMin) / _sliderMax * 100).toInt(), // Portion for green
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    // Yellow section (High range)
                    Expanded(
                      flex: ((_sliderMax - _normalRangeMax) / _sliderMax * 100).toInt(), // Portion for yellow
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
              // Slider on top of the sections
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.transparent,
                  inactiveTrackColor: Colors.transparent,
                  thumbShape: CustomSliderThumbCircle(
                    thumbRadius: 09,
                    showValue: showValue,
                    normalRangeMin: _normalRangeMin,
                    normalRangeMax: _normalRangeMax,
                  ),
                ),
                child: Slider(
                  value: _currentValue,
                  min: _sliderMin,
                  max: _sliderMax,
                  divisions: (_sliderMax - _sliderMin).toInt(),
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                      showValue = _sliderMax - value; // Update showValue when slider changes
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final double showValue;
  final double normalRangeMin;
  final double normalRangeMax;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.showValue,
    required this.normalRangeMin,
    required this.normalRangeMax,
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
      ..color = AppColors.blackColor // You can use AppColors.blackColor if needed
      ..strokeWidth = thumbRadius; // Width of the line
    canvas.drawLine(
      Offset(center.dx, center.dy - thumbRadius), // Start point
      Offset(center.dx, center.dy + thumbRadius), // End point
      thumbPaint,
    );

    // Draw the value tooltip above the thumb
    final TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * 0.8,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      text: '${showValue.toStringAsFixed(2)}',
    );

    final TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );

    tp.layout();
    Offset tooltipOffset = Offset(
        center.dx - tp.width / 2,
        center.dy - thumbRadius * 2 - tp.height);

    // Draw tooltip background with border
    final Rect tooltipRect = Rect.fromLTWH(
      tooltipOffset.dx - 5,
      tooltipOffset.dy - 5,
      tp.width + 10,
      tp.height + 10,
    );

    // Tooltip background
    final Paint tooltipPaint = Paint()..color = Colors.white;
    canvas.drawRect(tooltipRect, tooltipPaint);

    // Tooltip border
    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(tooltipRect, borderPaint);

    // Draw the value text inside the tooltip
    tp.paint(canvas, tooltipOffset);
  }
}
