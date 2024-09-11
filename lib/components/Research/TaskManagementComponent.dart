import 'package:flutter/material.dart';

class TaskManagementComponent extends StatelessWidget {
  final String taskName;
  final double taskProgress;

  TaskManagementComponent({required this.taskName, required this.taskProgress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(taskName),
        subtitle: LinearProgressIndicator(value: taskProgress),
        trailing: Icon(Icons.task),
        onTap: () {
          // View task details
        },
      ),
    );
  }
}
