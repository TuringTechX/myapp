import 'package:flutter/material.dart';

class JobListingComponent extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;

  JobListingComponent({required this.jobTitle, required this.companyName, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(jobTitle),
        subtitle: Text('$companyName - $location'),
        trailing: Icon(Icons.work),
        onTap: () {
          // View job details or apply
        },
      ),
    );
  }
}
