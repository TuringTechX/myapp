import 'package:flutter/material.dart';

class SocialImpactRatingComponent extends StatelessWidget {
  final double impactRating;
  final String description;

  SocialImpactRatingComponent({required this.impactRating, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Social Impact Rating'),
            subtitle: Text(description),
          ),
          Slider(
            value: impactRating,
            min: 0,
            max: 5,
            divisions: 5,
            label: impactRating.toString(),
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}
