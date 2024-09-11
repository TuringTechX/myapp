import 'package:flutter/material.dart';

class CryptocurrencyPriceTrackerComponent extends StatelessWidget {
  final String cryptoName;
  final double currentPrice;

  CryptocurrencyPriceTrackerComponent({required this.cryptoName, required this.currentPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Current Price of $cryptoName'),
        subtitle: Text('\$$currentPrice'),
        trailing: Icon(Icons.show_chart),
        onTap: () {
          // View historical price trends
        },
      ),
    );
  }
}
