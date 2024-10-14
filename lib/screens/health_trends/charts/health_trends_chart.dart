import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';

class HealthTrendsChart extends StatelessWidget {
  final List<HealthTrends> healthTrendsList;

  const HealthTrendsChart({
    super.key,
    required this.healthTrendsList,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _buildBarGroups(),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();
                return const Text("trendName");
              },
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
          border: const Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
          ),
        ),
        gridData: const FlGridData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) {
              return AppColors.primaryColor;
            },
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                'trendName: ${rod.toY}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Create bar groups from the health trends data
  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(healthTrendsList.length, (index) {
      final trend = healthTrendsList[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: double.tryParse(trend.score ?? '0') ?? 0,
            color: Colors.blue,
          ),
        ],
      );
    });
  }
}
