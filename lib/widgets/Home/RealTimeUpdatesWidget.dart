import 'package:flutter/material.dart';
import '../../services/RealTimeDataService.dart';

class RealTimeUpdatesWidget extends StatelessWidget {
  final RealTimeDataService _realTimeDataService = RealTimeDataService();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Real-Time Updates',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Section for Real-Time Updates
            FutureBuilder<List<String>>(
              future: _realTimeDataService.fetchRealTimeUpdates(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No updates available'));
                } else {
                  final updates = snapshot.data!;
                  return Column(
                    children: updates.map((update) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(update, style: const TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                  );
                }
              },
            ),

            const SizedBox(height: 20),

            // Section for Quick Access Items
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _realTimeDataService.fetchQuickAccessItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No quick access items available'));
                } else {
                  final items = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(item['title'],
                              style: const TextStyle(fontSize: 16)),
                          subtitle: Text(item['description']),
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
