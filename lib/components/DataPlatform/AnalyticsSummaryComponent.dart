import 'package:flutter/material.dart';

class AnalyticsSummaryComponent extends StatelessWidget {
  final Map<String, dynamic> summaryData;

  AnalyticsSummaryComponent({required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Analytics Summary', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Total Users: ${summaryData['totalUsers']}'),
            Text('Active Users: ${summaryData['activeUsers']}'),
            Text('New Users: ${summaryData['newUsers']}'),
          ],
        ),
      ),
    );
  }
}
