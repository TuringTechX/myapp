// lib/widgets/Home/QuickAccessWidget.dart
import 'package:flutter/material.dart';
import '../../services/RealTimeDataService.dart';

class QuickAccessWidget extends StatelessWidget {
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
              'Quick Access',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _realTimeDataService.fetchQuickAccessItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No quick access items available'));
                } else {
                  final quickAccessItems = snapshot.data!;
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: quickAccessItems.length,
                    itemBuilder: (context, index) {
                      final item = quickAccessItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, item['route']);
                        },
                        child: Card(
                          elevation: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.store,
                                  size:
                                      40), // This can be changed to dynamic icons
                              SizedBox(height: 10),
                              Text(item['label'],
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    },
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
