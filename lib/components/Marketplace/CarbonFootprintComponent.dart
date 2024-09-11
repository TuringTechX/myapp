import 'package:flutter/material.dart';

class CarbonFootprintComponent extends StatelessWidget {
  final double carbonFootprint;

  CarbonFootprintComponent({required this.carbonFootprint});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Your Carbon Footprint'),
        subtitle: Text('$carbonFootprint kg CO2'),
        trailing: Icon(Icons.eco),
        onTap: () {
          // View detailed carbon footprint breakdown
        },
      ),
    );
  }
}
