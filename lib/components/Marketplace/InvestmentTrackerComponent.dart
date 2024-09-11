import 'package:flutter/material.dart';

class InvestmentTrackerComponent extends StatelessWidget {
  final double investmentAmount;
  final double returnOnInvestment;

  InvestmentTrackerComponent(
      {required this.investmentAmount, required this.returnOnInvestment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Investment Amount: \$$investmentAmount'),
        subtitle: Text('ROI: $returnOnInvestment%'),
        trailing: Icon(Icons.attach_money),
        onTap: () {
          // View investment details
        },
      ),
    );
  }
}
