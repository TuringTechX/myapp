import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ImpactMetricsComponent extends StatelessWidget {
  final double metricProgress;
  final String metricDescription;

  ImpactMetricsComponent({required this.metricProgress, required this.metricDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Impact Metrics'),
            subtitle: Text(metricDescription),
          ),
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 8.0,
            percent: metricProgress,
            center: Text('${(metricProgress * 100).toStringAsFixed(0)}%'),
            progressColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
