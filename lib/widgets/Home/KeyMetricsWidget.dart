// lib/widgets/Home/KeyMetricsWidget.dart
import 'package:flutter/material.dart';
import '../../services/RealTimeDataService.dart';

class KeyMetricsWidget extends StatelessWidget {
  final RealTimeDataService _realTimeDataService = RealTimeDataService();

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
              'Key Metrics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<Map<String, String>>(
              future: _realTimeDataService.fetchKeyMetrics(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No metrics available'));
                } else {
                  final keyMetrics = snapshot.data!;
                  return Column(
                    children: keyMetrics.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(entry.key, style: TextStyle(fontSize: 16)),
                            Text(entry.value, style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      );
                    }).toList(),
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
