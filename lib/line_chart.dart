import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  SimpleLineChart({super.key});
  final List<FlSpot> chartData = [
    FlSpot(0, 20),
    FlSpot (	0.1	, 	20.04442981	),
    FlSpot (	0.2	, 	20.13320169	),
    FlSpot (	0.3	, 	20.26614032	),
    FlSpot (	0.4	, 	20.44298313	),
    FlSpot (	0.5	, 	20.66338087	),
    FlSpot (	0.6	, 	20.92689826	),
    FlSpot (	0.7	, 	21.23301486	),
    FlSpot (	0.8	, 	21.58112609	),
    FlSpot (	0.9	, 	21.97054443	),

    FlSpot(1, 22),
    FlSpot(2, 19),
    FlSpot(3, 24),
    FlSpot(4, 23),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChart(
        LineChartData(
          minY: 0,
          maxY: 25,

          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              // tooltipBgColor: Colors.blueAccent,
            ),
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  FlLine(color: Colors.red, strokeWidth: 2),
                  FlDotData(show: true),
                );
              }).toList();
            },
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text('${value.toInt()}');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text('${value.toInt()}°');
                },
              ),
            ),
          ),
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: chartData,
              isCurved: true,
              barWidth: 4,
              color: Colors.blue,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}