import 'package:flutter/material.dart';

class VoterRegistrationComponent extends StatelessWidget {
  final bool isRegistered;

  VoterRegistrationComponent({required this.isRegistered});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Voter Registration'),
        subtitle: Text(isRegistered ? 'You are registered' : 'Not registered'),
        trailing: Icon(isRegistered ? Icons.check_circle : Icons.cancel),
        onTap: () {
          // Navigate to registration process or details
        },
      ),
    );
  }
}
