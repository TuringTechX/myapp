import 'package:flutter/material.dart';

class ProjectDetailsComponent extends StatelessWidget {
  final String projectName;
  final String description;

  ProjectDetailsComponent(
      {required this.projectName, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(projectName),
        subtitle: Text(description),
        trailing: Icon(Icons.info),
        onTap: () {
          // Navigate to project details
        },
      ),
    );
  }
}
