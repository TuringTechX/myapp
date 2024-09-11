import 'package:flutter/material.dart';
import '../services/AIModelService.dart';

class SustainabilityScoreComponent extends StatefulWidget {
  @override
  _SustainabilityScoreComponentState createState() => _SustainabilityScoreComponentState();
}

class _SustainabilityScoreComponentState extends State<SustainabilityScoreComponent> {
  double score = 0.0;

  @override
  void initState() {
    super.initState();
    _loadScore();
  }

  _loadScore() async {
    double fetchedScore = await AIModelService().calculateSustainabilityScore();
    setState(() {
      score = fetchedScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Your Sustainability Score', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          score == 0.0
              ? CircularProgressIndicator()
              : Text(score.toStringAsFixed(2), style: TextStyle(fontSize: 36)),
        ],
      ),
    );
  }
}
