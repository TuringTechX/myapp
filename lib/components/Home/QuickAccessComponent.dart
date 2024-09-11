import 'package:flutter/material.dart';

class QuickAccessComponent extends StatelessWidget {
  final List<Map<String, dynamic>> quickLinks;

  QuickAccessComponent({required this.quickLinks});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: quickLinks.length,
      itemBuilder: (context, index) {
        final link = quickLinks[index];
        return GestureDetector(
          onTap: () {
            // Navigate to the corresponding feature
          },
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(link['icon'], size: 40),
                SizedBox(height: 10),
                Text(link['label'], style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}
