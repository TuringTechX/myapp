import 'package:flutter/material.dart';

class ImpactReportingComponent extends StatelessWidget {
  final String reportTitle;
  final String impactSummary;

  ImpactReportingComponent({required this.reportTitle, required this.impactSummary});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(reportTitle),
        subtitle: Text(impactSummary),
        trailing: Icon(Icons.report),
        onTap: () {
          // Navigate to report details
        },
      ),
    );
  }
}
