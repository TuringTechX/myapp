import 'package:flutter/material.dart';

class InvestmentOpportunityComponent extends StatelessWidget {
  final String opportunityName;
  final double expectedReturn;

  InvestmentOpportunityComponent(
      {required this.opportunityName, required this.expectedReturn});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(opportunityName),
        subtitle:
            Text('Expected Return: ${expectedReturn.toStringAsFixed(2)}%'),
        trailing: Icon(Icons.trending_up),
        onTap: () {
          // View investment details
        },
      ),
    );
  }
}
