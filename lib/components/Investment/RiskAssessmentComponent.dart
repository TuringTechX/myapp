import 'package:flutter/material.dart';

class RiskAssessmentComponent extends StatelessWidget {
  final String investmentTitle;
  final double riskLevel;

  RiskAssessmentComponent({required this.investmentTitle, required this.riskLevel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Risk Assessment: $investmentTitle'),
            subtitle: Text('Risk Level: ${riskLevel.toStringAsFixed(2)}'),
          ),
          LinearProgressIndicator(
            value: riskLevel / 10, // Assuming risk level is between 0 and 10
            backgroundColor: Colors.grey.shade300,
            color: riskLevel > 7 ? Colors.red : Colors.green,
          ),
        ],
      ),
    );
  }
}
