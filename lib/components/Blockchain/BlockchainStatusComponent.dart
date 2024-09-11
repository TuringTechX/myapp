import 'package:flutter/material.dart';

class BlockchainStatusComponent extends StatelessWidget {
  final String status;
  final String lastBlock;

  BlockchainStatusComponent({required this.status, required this.lastBlock});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Blockchain Status'),
        subtitle: Text('Status: $status\nLast Block: $lastBlock'),
        trailing: Icon(Icons.blockchain),
        onTap: () {
          // Navigate to blockchain status details
        },
      ),
    );
  }
}
