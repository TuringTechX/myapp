// lib/widgets/Home/PersonalizedFeedWidget.dart
import 'package:flutter/material.dart';
import '../../services/RealTimeDataService.dart';

class PersonalizedFeedWidget extends StatelessWidget {
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
              'Personalized Feed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<String>>(
              future: _realTimeDataService.fetchPersonalizedFeed(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No feed items available'));
                } else {
                  final feedItems = snapshot.data!;
                  return Column(
                    children: feedItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(item, style: TextStyle(fontSize: 16)),
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
