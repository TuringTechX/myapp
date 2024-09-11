import 'package:flutter/material.dart';

class AdvocacyActionComponent extends StatelessWidget {
  final String actionTitle;
  final String deadline;

  AdvocacyActionComponent({required this.actionTitle, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(actionTitle),
        subtitle: Text('Complete by: $deadline'),
        trailing: Icon(Icons.flag),
        onTap: () {
          // View action details
        },
      ),
    );
  }
}
