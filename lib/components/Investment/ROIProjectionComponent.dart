import 'package:flutter/material.dart';

class ROIProjectionComponent extends StatelessWidget {
  final String investmentTitle;
  final double projectedROI;

  ROIProjectionComponent({required this.investmentTitle, required this.projectedROI});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('ROI Projection: $investmentTitle'),
        subtitle: Text('Projected ROI: ${projectedROI.toStringAsFixed(2)}%'),
        trailing: Icon(Icons.trending_up),
        onTap: () {
          // View details on ROI calculation
        },
      ),
    );
  }
}
