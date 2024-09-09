// lib/screens/HomeScreen.dart
import 'package:flutter/material.dart';
import '../widgets/Home/PersonalizedFeedWidget.dart';
import '../widgets/Home/QuickAccessWidget.dart';
import '../widgets/Home/RealTimeUpdatesWidget.dart';
import '../widgets/Home/KeyMetricsWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            KeyMetricsWidget(),
            SizedBox(height: 20),
            QuickAccessWidget(),
            SizedBox(height: 20),
            RealTimeUpdatesWidget(),
            SizedBox(height: 20),
            PersonalizedFeedWidget(),
          ],
        ),
      ),
    );
  }
}
