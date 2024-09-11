import 'package:flutter/material.dart';

class TransactionRecordComponent extends StatelessWidget {
  final String transactionId;
  final double amount;
  final String date;

  TransactionRecordComponent({required this.transactionId, required this.amount, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Transaction ID: $transactionId'),
        subtitle: Text('Amount: \$$amount\nDate: $date'),
        trailing: Icon(Icons.receipt),
        onTap: () {
          // View transaction details
        },
      ),
    );
  }
}
