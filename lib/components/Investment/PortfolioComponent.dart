import 'package:flutter/material.dart';

class PortfolioComponent extends StatelessWidget {
  final String portfolioName;
  final double currentValue;

  PortfolioComponent({required this.portfolioName, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(portfolioName),
        subtitle: Text('Current Value: \$${currentValue.toStringAsFixed(2)}'),
        trailing: Icon(Icons.pie_chart),
        onTap: () {
          // View portfolio details
        },
      ),
    );
  }
}
