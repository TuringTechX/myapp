// lib/widgets/DataPlatform/AnalyticsDashboardWidget.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../services/DataService.dart';

class AnalyticsDashboardWidget extends StatelessWidget {
  final DataService _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Analytics Dashboard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _dataService.fetchGlobalData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available for analytics'));
                } else {
                  final data = snapshot.data!;
                  // Assume that 'value' is a numeric percentage for charting purposes
                  List<double> chartData = data.map((entry) {
                    return double.parse(
                        entry['value'].replaceAll(RegExp(r'[^0-9.]'), ''));
                  }).toList();

                  return LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: chartData
                              .asMap()
                              .entries
                              .map((entry) =>
                                  FlSpot(entry.key.toDouble(), entry.value))
                              .toList(),
                          isCurved: true,
                          colors: [Colors.blue],
                          dotData: FlDotData(show: false),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
