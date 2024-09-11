import 'package:flutter/material.dart';

class MarketplaceItemComponent extends StatelessWidget {
  final String itemName;
  final double price;

  MarketplaceItemComponent({required this.itemName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(itemName),
        subtitle: Text('\$$price'),
        trailing: Icon(Icons.shopping_cart),
        onTap: () {
          // Navigate to item details or add to cart
        },
      ),
    );
  }
}
