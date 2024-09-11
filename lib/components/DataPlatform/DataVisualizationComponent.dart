import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataVisualizationComponent extends StatelessWidget {
  final List<ChartData> chartData;

  DataVisualizationComponent({required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      title: const ChartTitle(text: 'Data Overview'),
      legend: const Legend(isVisible: true),
      series: <ChartSeries>[
        LineSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
