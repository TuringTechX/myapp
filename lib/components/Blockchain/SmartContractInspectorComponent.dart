import 'package:flutter/material.dart';

class SmartContractInspectorComponent extends StatelessWidget {
  final String contractAddress;
  final String contractStatus;

  SmartContractInspectorComponent({required this.contractAddress, required this.contractStatus});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Smart Contract Address: $contractAddress'),
            subtitle: Text('Status: $contractStatus'),
          ),
          ElevatedButton(
            onPressed: () {
              // Inspect the contract for any vulnerabilities
            },
            child: Text('Inspect Contract'),
          ),
        ],
      ),
    );
  }
}
