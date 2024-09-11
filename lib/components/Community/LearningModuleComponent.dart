import 'package:flutter/material.dart';

class LearningModuleComponent extends StatelessWidget {
  final String moduleTitle;
  final String progress;

  LearningModuleComponent({required this.moduleTitle, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(moduleTitle),
        subtitle: Text('Progress: $progress%'),
        trailing: Icon(Icons.school),
        onTap: () {
          // Navigate to learning module details
        },
      ),
    );
  }
}
