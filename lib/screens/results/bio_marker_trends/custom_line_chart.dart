import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key});

  @override
  Widget build(BuildContext context) {
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
            maxX: 10,
            minY: 0,
            maxY: 300,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 100),
                  const FlSpot(2.5, 250),
                  const FlSpot(5, 200),
                  const FlSpot(7.5, 150),
                  const FlSpot(10, 250),
                ],
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
}
