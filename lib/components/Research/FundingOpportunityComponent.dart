import 'package:flutter/material.dart';

class FundingOpportunityComponent extends StatelessWidget {
  final String fundingTitle;
  final String applicationDeadline;

  FundingOpportunityComponent(
      {required this.fundingTitle, required this.applicationDeadline});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(fundingTitle),
        subtitle: Text('Deadline: $applicationDeadline'),
        trailing: Icon(Icons.attach_money),
        onTap: () {
          // View funding details or apply
        },
      ),
    );
  }
}
