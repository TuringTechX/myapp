// lib/screens/HealthAndSustainabilityRecommendations/HealthOverviewScreen.dart

import 'package:flutter/material.dart';
import 'dart:async'; // For simulating real-time updates
import 'package:percent_indicator/circular_percent_indicator.dart';

class HealthOverviewScreen extends StatefulWidget {
  @override
  _HealthOverviewScreenState createState() => _HealthOverviewScreenState();
}

class _HealthOverviewScreenState extends State<HealthOverviewScreen> {
  // Real-time data for health metrics (Simulated)
  int stepsTaken = 5000;
  int caloriesBurned = 200;
  double waterIntake = 1.5;

  // Timer for simulating real-time updates
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Simulate fetching real-time data from an API every 5 seconds
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      fetchRealTimeData();
    });
  }

  // Simulated function to fetch real-time data from API (replace with actual API call)
  Future<void> fetchRealTimeData() async {
    // Here you can replace the code with actual API calls to get real-time data
    setState(() {
      stepsTaken = (stepsTaken + 500) % 10000; // Simulating steps taken
      caloriesBurned =
          (caloriesBurned + 50) % 500; // Simulating calories burned
      waterIntake = (waterIntake + 0.1) % 3.0; // Simulating water intake
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Clean up timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Overview'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings action
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Health Metrics Overview
            Text(
              'Your Health Metrics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Steps Taken - With Animation
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildHealthMetricCard('Steps Taken', '$stepsTaken',
                  '10,000', Icons.directions_walk),
            ),
            SizedBox(height: 16),

            // Calories Burned - With Animation
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildHealthMetricCard('Calories Burned',
                  '$caloriesBurned', '500', Icons.local_fire_department),
            ),
            SizedBox(height: 16),

            // Water Intake - With Animation
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildHealthMetricCard(
                  'Water Intake',
                  '${waterIntake.toStringAsFixed(1)}L',
                  '3.0L',
                  Icons.local_drink),
            ),

            SizedBox(height: 24),

            // Section 2: Sustainability Recommendations with animation
            Text(
              'Sustainability Tips',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildSustainabilityTipCard('Eco-Friendly Diet',
                  'Try incorporating more plant-based meals into your diet to reduce your carbon footprint.'),
            ),
            SizedBox(height: 16),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildSustainabilityTipCard('Sustainable Exercise',
                  'Consider outdoor workouts or cycling to avoid the energy consumption of indoor gyms.'),
            ),

            SizedBox(height: 24),

            // Section 3: Progress Tracker
            Text(
              'Daily Goal Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Center(
              child: CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 13.0,
                animation: true,
                percent: stepsTaken / 10000, // Based on steps progress
                center: Text(
                  "${(stepsTaken / 100).toStringAsFixed(0)}%",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                footer: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "You've completed ${(stepsTaken / 100).toStringAsFixed(0)}% of your daily health goals.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.green,
              ),
            ),

            SizedBox(height: 24),

            // Section 4: Achievements & Badges with animation
            Text(
              'Achievements',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildAchievementBadge(
                  'Health Streak', '5-Day Streak', Icons.star),
            ),
            SizedBox(height: 16),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildAchievementBadge('Sustainable Habits',
                  'Completed 3 sustainable challenges', Icons.eco),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for health metric cards with animation support
  Widget _buildHealthMetricCard(
      String title, String current, String goal, IconData icon) {
    return Card(
      key: ValueKey(current), // For AnimatedSwitcher to track changes
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Current: $current, Goal: $goal'),
      ),
    );
  }

  // Widget for sustainability tips
  Widget _buildSustainabilityTipCard(String title, String description) {
    return Card(
      key: ValueKey(description), // For AnimatedSwitcher
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(Icons.lightbulb_outline, size: 40, color: Colors.orange),
        title: Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }

  // Widget for achievements
  Widget _buildAchievementBadge(
      String title, String description, IconData icon) {
    return Card(
      key: ValueKey(description), // For AnimatedSwitcher
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.purple),
        title: Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
