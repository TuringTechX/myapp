import 'package:flutter/material.dart';

class CollaboratorFinderComponent extends StatelessWidget {
  final List<String> availableCollaborators;
  final Function(String) onCollaboratorSelected;

  CollaboratorFinderComponent(
      {required this.availableCollaborators,
      required this.onCollaboratorSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Find a Collaborator',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...availableCollaborators.map((collaborator) {
            return ListTile(
              title: Text(collaborator),
              trailing: Icon(Icons.person_add),
              onTap: () {
                onCollaboratorSelected(collaborator);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
