import 'package:flutter/material.dart';

class SuggestionComponent extends StatelessWidget {
  final String suggestion;

  SuggestionComponent({required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Sustainability Suggestion'),
        subtitle: Text(suggestion),
        trailing: Icon(Icons.lightbulb),
        onTap: () {
          // Navigate to detailed suggestion
        },
      ),
    );
  }
}
