import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../services/RealTimeDataService.dart';
import '../../widgets/Shared/ErrorHandlingWidget.dart';

class KeyMetricsWidget extends StatelessWidget {
  final RealTimeDataService _realTimeDataService = RealTimeDataService();
  final FirebaseAnalytics _analytics = FirebaseAnalytics(); // Add Firebase Analytics instance

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
                  return ErrorHandlingWidget(errorMessage: snapshot.error.toString());
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No metrics available'));
                } else {
                  // Log the event when key metrics are displayed
                  _analytics.logEvent(
                    name: 'view_key_metrics',
                    parameters: {
                      'user_id': '12345', // Replace with actual user id
                      'timestamp': DateTime.now().toIso8601String(),
                    },
                  );

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
