import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  ChartWidget({
    super.key,
  });

  List<ChartData> chartData = [
    ChartData('Sun', 2),
    ChartData('Mon', 4),
    ChartData('Tue', 3),
    ChartData('Wed', 6),
    ChartData('Thu', 5),
    ChartData('Fri', 9),
  ];

  List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      //Initialize the spark charts widget
      child: SfCartesianChart(
        backgroundColor: Colors.white,
        plotAreaBorderWidth: 0, // X top line
        plotAreaBorderColor: Colors.white24,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks,
          interval: 1,
          isVisible: true,
          labelStyle: const TextStyle(color: Colors.black),
          // Replace chartData's DateTime with weekdays
        ),
        primaryYAxis: NumericAxis(
          interval: 2,
          majorGridLines: const MajorGridLines(
              width: 1, color: Colors.black12, dashArray: <double>[5, 5]),
          axisLine: const AxisLine(
              color: Colors.white, // Y left line
              dashArray: <double>[5, 5]),
          minimum: 0,
          maximum: 10,
        ),

        series: <CartesianSeries<dynamic, dynamic>>[
          SplineAreaSeries<ChartData, String>(
            borderColor: Colors.green[200],
            borderWidth: 2,
            gradient: LinearGradient(
              colors: [
                Colors.green.withOpacity(0.4),
                Colors.green.withOpacity(0.2),
                Colors.green.withOpacity(0.1)
              ],
              stops: const [0.1, 0.3, 0.6],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            dataSource: chartData
                .asMap()
                .map((index, data) => MapEntry(daysOfWeek[index], data))
                .values
                .toList(),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            cardinalSplineTension: 0.1,
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final num y;

  ChartData(this.x, this.y);
}
