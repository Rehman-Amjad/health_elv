import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.50,
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: BarChart(
          BarChartData(
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
            minY: 0,
            maxY: 300,
            barGroups: _getBarGroups(),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    final random = Random();
    final barsData = List.generate(7, (index) => random.nextDouble() * 300);

    return barsData.asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: 300,
            borderRadius: BorderRadius.zero,
            gradient: LinearGradient(
              colors: const [
                AppColors.whiteColor,
                Color(0xFF9ED2F0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [
                value / 300,
                value / 300,
              ], // The transition point
            ),
            width: 20,
          ),
        ],
      );
    }).toList();
  }
}

// List<BarChartGroupData> _getBarGroups() {
//   return [
//     BarChartGroupData(
//       x: 0,
//       barRods: [
//         BarChartRodData(
//           toY: 300,
//           color: Colors.blue,
//           borderRadius: BorderRadius.zero,
//         ),
//       ],
//     ),
//     BarChartGroupData(
//       x: 1,
//       barRods: [
//         BarChartRodData(
//           toY: 300,
//           color: Colors.blue,
//           borderRadius: BorderRadius.zero,
//         ),
//       ],
//     ),
//     BarChartGroupData(
//       x: 2,
//       barRods: [
//         BarChartRodData(
//           toY: 300,
//           color: Colors.blue,
//           borderRadius: BorderRadius.zero,
//         ),
//       ],
//     ),
//     BarChartGroupData(
//       x: 3,
//       barRods: [
//         BarChartRodData(
//           toY: 300,
//           color: Colors.blue,
//           borderRadius: BorderRadius.zero,
//         ),
//       ],
//     ),
//     BarChartGroupData(
//       x: 4,
//       barRods: [
//         BarChartRodData(
//           toY: 300,
//           color: Colors.blue,
//           borderRadius: BorderRadius.zero,
//         ),
//       ],
//     ),
//     BarChartGroupData(
//       x: 4,
//       barRods: [
//         BarChartRodData(
//           toY: 300,
//           color: Colors.blue,
//           borderRadius: BorderRadius.zero,
//         ),
//       ],
//     ),
//   ];
// }
//}
