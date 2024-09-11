import 'package:flutter/material.dart';

class GrantProposalComponent extends StatelessWidget {
  final String proposalTitle;
  final String status;

  GrantProposalComponent({required this.proposalTitle, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(proposalTitle),
        subtitle: Text('Status: $status'),
        trailing: Icon(Icons.description),
        onTap: () {
          // View full proposal
        },
      ),
    );
  }
}
