// lib/widgets/Healthcare/HealthRecommendationWidget.dart
import 'package:flutter/material.dart';
import '../../services/HealthcareService.dart';

class HealthRecommendationWidget extends StatelessWidget {
  final HealthcareService _healthcareService = HealthcareService();

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
              'Health Recommendations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<Map<String, dynamic>>(
              future: _healthcareService.fetchHealthRecommendations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(
                      child: Text('No health recommendations available'));
                } else {
                  final data = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Diet: ${data['diet']}',
                          style: TextStyle(fontSize: 16)),
                      Text('Exercise: ${data['exercise']}',
                          style: TextStyle(fontSize: 16)),
                      Text('Sleep: ${data['sleep']}',
                          style: TextStyle(fontSize: 16)),
                    ],
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
