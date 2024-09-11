import 'package:flutter/material.dart';

class RealTimeUpdatesComponent extends StatelessWidget {
  final List<String> updates;

  RealTimeUpdatesComponent({required this.updates});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Real-time Updates', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: updates.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(updates[index]),
              leading: Icon(Icons.update),
            );
          },
        ),
      ],
    );
  }
}
