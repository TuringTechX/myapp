import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HealthProgressTrackerComponent extends StatelessWidget {
  final double healthProgress;
  final String goal;

  HealthProgressTrackerComponent(
      {required this.healthProgress, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Health Progress'),
            subtitle: Text('Goal: $goal'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              percent: healthProgress,
              backgroundColor: Colors.grey.shade300,
              progressColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
