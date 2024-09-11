import 'package:flutter/material.dart';

class PersonalizedFeedComponent extends StatelessWidget {
  final List<dynamic> feedData; // Feed data to display

  PersonalizedFeedComponent({required this.feedData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: feedData.length,
      itemBuilder: (context, index) {
        final item = feedData[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(item['title']),
            subtitle: Text(item['description']),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to detailed view of feed item
            },
          ),
        );
      },
    );
  }
}
