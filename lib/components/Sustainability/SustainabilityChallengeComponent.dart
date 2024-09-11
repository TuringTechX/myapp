import 'package:flutter/material.dart';

class SustainabilityChallengeComponent extends StatelessWidget {
  final String challengeName;
  final String deadline;

  SustainabilityChallengeComponent({required this.challengeName, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(challengeName),
        subtitle: Text('Complete by: $deadline'),
        trailing: Icon(Icons.eco),
        onTap: () {
          // Navigate to challenge details
        },
      ),
    );
  }
}
