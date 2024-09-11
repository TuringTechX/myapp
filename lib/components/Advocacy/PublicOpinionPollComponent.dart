import 'package:flutter/material.dart';

class PublicOpinionPollComponent extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onOptionSelected;

  PublicOpinionPollComponent(
      {required this.question,
      required this.options,
      required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(question),
          ),
          ...options.map((option) {
            return RadioListTile(
              title: Text(option),
              value: option,
              groupValue:
                  null, // You would normally store the selected value here
              onChanged: (value) {
                onOptionSelected(value.toString());
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
