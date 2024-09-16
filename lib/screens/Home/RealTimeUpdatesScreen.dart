// lib/screens/Home/RealTimeUpdatesScreen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RealTimeUpdatesScreen extends StatelessWidget {
  final CollectionReference energyUsage =
      FirebaseFirestore.instance.collection('energyUsage');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Updates'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Line Chart for Energy Consumption Data
              Text(
                'Energy Consumption',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              StreamBuilder<QuerySnapshot>(
                stream: energyUsage.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error loading data');
                  }
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  final data = snapshot.data!.docs
                      .map((doc) => doc['usage'].toDouble())
                      .toList();
                  return SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(data.length, (index) {
                              return FlSpot(index.toDouble(), data[index]);
                            }),
                            isCurved: true,
                            colors: [Colors.green],
                            barWidth: 2,
                          ),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(showTitles: true),
                          bottomTitles: SideTitles(showTitles: true),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),

              // Real-Time Carbon Footprint Progress Indicator
              Text(
                'Carbon Footprint Reduction',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('carbonFootprint')
                    .doc('currentMetrics')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error loading data');
                  }
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  final double percentage =
                      snapshot.data!['percentage'].toDouble();
                  return CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 10.0,
                    percent: percentage / 100,
                    center: new Text("${percentage.toStringAsFixed(1)}%"),
                    progressColor: Colors.green,
                  );
                },
              ),

              SizedBox(height: 40),

              // Additional Metrics Section
              Text(
                'Key Metrics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MetricCard(title: 'Water Usage', value: '12k Liters'),
                  MetricCard(title: 'Waste Generated', value: '5 Tons'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MetricCard(title: 'Renewable Energy', value: '80%'),
                  MetricCard(title: 'CO2 Reduction', value: '22%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for displaying metrics in card form
class MetricCard extends StatelessWidget {
  final String title;
  final String value;

  const MetricCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
