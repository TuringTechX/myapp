// lib/widgets/DataPlatform/GlobalDataHubWidget.dart
import 'package:flutter/material.dart';
import '../../services/DataService.dart';

class GlobalDataHubWidget extends StatelessWidget {
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
              'Global Data Hub',
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
                  return Center(child: Text('No global data available'));
                } else {
                  final data = snapshot.data!;
                  return Column(
                    children: data.map((entry) {
                      return ListTile(
                        title: Text(entry['category']),
                        subtitle: Text(entry['value']),
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
