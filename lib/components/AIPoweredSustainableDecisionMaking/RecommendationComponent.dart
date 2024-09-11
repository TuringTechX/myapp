import 'package:flutter/material.dart';
import '../services/AIRecommendationService.dart';

class RecommendationComponent extends StatefulWidget {
  @override
  _RecommendationComponentState createState() =>
      _RecommendationComponentState();
}

class _RecommendationComponentState extends State<RecommendationComponent> {
  String recommendation = "";

  @override
  void initState() {
    super.initState();
    _loadRecommendation();
  }

  _loadRecommendation() async {
    // Fetch recommendation using AIRecommendationService
    String result = await AIRecommendationService().getRecommendation();
    setState(() {
      recommendation = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AI-Powered Sustainable Recommendation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            recommendation.isEmpty
                ? CircularProgressIndicator()
                : Text(recommendation, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
