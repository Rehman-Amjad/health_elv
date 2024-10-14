import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';

class CustomLineChart extends StatelessWidget {
  final List<BloodTestResults> testResults;

  const CustomLineChart({
    super.key,
    required this.testResults,
  });

  @override
  Widget build(BuildContext context) {
    // Create list of spots from currentRange values in testResults
    List<FlSpot> spots = _generateSpotsFromTestResults(testResults);
    return AspectRatio(
      aspectRatio: 3.50,
      child: Container(
        padding: const EdgeInsets.only(left: 24,right: 24),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: spots.length.toDouble(), // Set maxX to match the number of spots
            minY: 0,
            maxY: 300,
            lineBarsData: [
              LineChartBarData(
                spots: spots, // Use dynamically generated spots
                isCurved: true,
                color:  AppColors.secondryColor,
                barWidth: 8,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
                dotData: const FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to generate FlSpot points from testResults
  List<FlSpot> _generateSpotsFromTestResults(List<BloodTestResults> testResults) {
    List<FlSpot> spots = [];

    for (int i = 0; i < testResults.length; i++) {
      double currentRange = double.parse(testResults[i].currentRange ?? '0');
      spots.add(FlSpot(i.toDouble(), currentRange));
    }

    return spots;
  }

  double getMinValue(List<BloodTestResults> testResults) {
    return testResults
        .map((test) => double.parse(test.currentRange ?? '0'))
        .reduce((value, element) => value < element ? value : element);
  }

  double getMaxValue(List<BloodTestResults> testResults) {
    return testResults
        .map((test) => double.parse(test.currentRange ?? '0'))
        .reduce((value, element) => value > element ? value : element);
  }
}
