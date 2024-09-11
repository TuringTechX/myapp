import 'package:flutter/material.dart';

class HealthRecommendationComponent extends StatelessWidget {
  final String recommendationTitle;
  final String recommendationDescription;

  HealthRecommendationComponent({required this.recommendationTitle, required this.recommendationDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(recommendationTitle),
        subtitle: Text(recommendationDescription),
        trailing: Icon(Icons.local_hospital),
        onTap: () {
          // View recommendation details
        },
      ),
    );
  }
}
