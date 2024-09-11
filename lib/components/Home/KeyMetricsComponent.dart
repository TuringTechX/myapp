import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class KeyMetricsComponent extends StatelessWidget {
  final double metricValue;
  final String metricLabel;

  KeyMetricsComponent({required this.metricValue, required this.metricLabel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(metricLabel, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: metricValue,
              backgroundColor: Colors.grey.shade300,
              progressColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
