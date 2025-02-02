// lib/widgets/Sustainability/SustainabilityChallengeWidget.dart
import 'package:flutter/material.dart';
import '../../services/SustainabilityService.dart';

class SustainabilityChallengeWidget extends StatelessWidget {
  final SustainabilityService _sustainabilityService = SustainabilityService();

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
              'Sustainability Challenges',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<Map<String, dynamic>>(
              future: _sustainabilityService.fetchSustainabilityChallenges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No challenges available'));
                } else {
                  final data = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Energy: ${data['energy']}',
                          style: TextStyle(fontSize: 16)),
                      Text('Water: ${data['water']}',
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
