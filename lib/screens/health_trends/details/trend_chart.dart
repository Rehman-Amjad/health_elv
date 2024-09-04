import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HealthTrendChart extends StatelessWidget {
  final double score;

  HealthTrendChart({
    super.key,
    this.score = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            // colors: [Colors.blue],
            barWidth: 8,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: true,
              // dotColor: Colors.blue,
              // dotSize: 8,
            ),
            belowBarData: BarAreaData(
              show: true,
              // colors: [Colors.blue.withOpacity(0.2)],
            ),
            spots: [
              const FlSpot(0, 10),
              const FlSpot(1, 20),
              const FlSpot(2, 40),
              const FlSpot(3, 60),
               FlSpot(4, score), // Peak point (corresponding to Wednesday)
              const FlSpot(5, 85),
              const FlSpot(6, 75),
            ],
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            )
          ),
          rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              )
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 100,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              },
              reservedSize: 40,
            ),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              //margin: 8,
            ),
          ),
        ),
        gridData: const FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 100,
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
        ),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: score,
      ),
    );
  }
}
