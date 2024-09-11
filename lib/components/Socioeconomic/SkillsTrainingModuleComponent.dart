import 'package:flutter/material.dart';

class SkillsTrainingModuleComponent extends StatelessWidget {
  final String moduleTitle;
  final double progress;

  SkillsTrainingModuleComponent({required this.moduleTitle, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(moduleTitle),
        subtitle: Text('Progress: $progress%'),
        trailing: Icon(Icons.school),
        onTap: () {
          // View training module details
        },
      ),
    );
  }
}
