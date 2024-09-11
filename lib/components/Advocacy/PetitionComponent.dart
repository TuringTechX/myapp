import 'package:flutter/material.dart';

class PetitionComponent extends StatelessWidget {
  final String petitionTitle;
  final int signatures;

  PetitionComponent({required this.petitionTitle, required this.signatures});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(petitionTitle),
        subtitle: Text('$signatures signatures'),
        trailing: Icon(Icons.gavel),
        onTap: () {
          // Navigate to petition details
        },
      ),
    );
  }
}
