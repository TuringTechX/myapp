import 'package:flutter/material.dart';
import '../services/AIModelService.dart';

class DecisionSupportComponent extends StatelessWidget {
  final String decisionType;

  DecisionSupportComponent({required this.decisionType});

  Future<String> getDecisionSupport() async {
    return await AIModelService().getDecisionSupport(decisionType);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDecisionSupport(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error fetching decision support');
        } else {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Decision Support for $decisionType', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(snapshot.data as String, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
