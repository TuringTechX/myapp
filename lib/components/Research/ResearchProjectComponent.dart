import 'package:flutter/material.dart';

class ResearchProjectComponent extends StatelessWidget {
  final String projectName;
  final String projectLead;

  ResearchProjectComponent({required this.projectName, required this.projectLead});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(projectName),
        subtitle: Text('Lead: $projectLead'),
        trailing: Icon(Icons.science),
        onTap: () {
          // Navigate to project details
        },
      ),
    );
  }
}
