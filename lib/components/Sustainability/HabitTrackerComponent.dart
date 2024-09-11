import 'package:flutter/material.dart';

class HabitTrackerComponent extends StatelessWidget {
  final String habitName;
  final double progress;

  HabitTrackerComponent({required this.habitName, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(habitName),
            subtitle: Text('Habit progress'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
