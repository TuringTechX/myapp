import 'package:flutter/material.dart';

class ResourceComponent extends StatelessWidget {
  final String resourceName;
  final String resourceDescription;

  ResourceComponent(
      {required this.resourceName, required this.resourceDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(resourceName),
        subtitle: Text(resourceDescription),
        trailing: Icon(Icons.library_books),
        onTap: () {
          // View resource details
        },
      ),
    );
  }
}
