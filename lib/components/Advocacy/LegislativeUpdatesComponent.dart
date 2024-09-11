import 'package:flutter/material.dart';

class LegislativeUpdatesComponent extends StatelessWidget {
  final String updateTitle;
  final String updateDate;

  LegislativeUpdatesComponent({required this.updateTitle, required this.updateDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(updateTitle),
        subtitle: Text('Updated on: $updateDate'),
        trailing: Icon(Icons.article),
        onTap: () {
          // Navigate to legislative update details
        },
      ),
    );
  }
}
