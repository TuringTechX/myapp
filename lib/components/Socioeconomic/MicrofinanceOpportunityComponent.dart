import 'package:flutter/material.dart';

class MicrofinanceOpportunityComponent extends StatelessWidget {
  final String opportunityName;
  final double interestRate;

  MicrofinanceOpportunityComponent(
      {required this.opportunityName, required this.interestRate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(opportunityName),
        subtitle: Text('Interest Rate: $interestRate%'),
        trailing: Icon(Icons.monetization_on),
        onTap: () {
          // View opportunity details or apply
        },
      ),
    );
  }
}
