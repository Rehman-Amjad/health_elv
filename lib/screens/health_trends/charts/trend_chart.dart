import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HealthTrendChart extends StatelessWidget {
  final double score;

  const HealthTrendChart({
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
            ),
            belowBarData: BarAreaData(
              show: true,
            ),
            spots: [
              FlSpot(0, score + 10),
              FlSpot(1, score + 20),
              FlSpot(2, score + 40),
              FlSpot(3, score + 50),
              FlSpot(4, score),
              FlSpot(5, score + 85),
              FlSpot(6, score + 75),
            ],
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
          )),
          rightTitles: const AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
          )),
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
        maxY: score + 100,
      ),
    );
  }
}
