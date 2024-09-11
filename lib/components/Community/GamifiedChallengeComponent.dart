import 'package:flutter/material.dart';

class GamifiedChallengeComponent extends StatelessWidget {
  final String challengeTitle;
  final String reward;

  GamifiedChallengeComponent({required this.challengeTitle, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(challengeTitle),
        subtitle: Text('Reward: $reward points'),
        trailing: Icon(Icons.star),
        onTap: () {
          // Participate in the challenge
        },
      ),
    );
  }
}
