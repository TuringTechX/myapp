// lib/screens/Home/QuickAccessScreen.dart

import 'package:flutter/material.dart';
import 'package:your_app/screens/Sustainability/SustainabilityScreen.dart';
import 'package:your_app/screens/ClimateChangeMitigation/CarbonTrackingScreen.dart';
import 'package:your_app/screens/ClimateChangeMitigation/EmissionReductionScreen.dart';
import 'package:your_app/screens/CircularEconomyAndWasteReduction/WasteTrackingScreen.dart';

class QuickAccessScreen extends StatefulWidget {
  @override
  _QuickAccessScreenState createState() => _QuickAccessScreenState();
}

class _QuickAccessScreenState extends State<QuickAccessScreen> {
  String updatedData =
      "No new updates"; // Store updated data received from other screens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Access'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              children: List.generate(_quickAccessItems.length, (index) {
                return QuickAccessCard(item: _quickAccessItems[index]);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Update: $updatedData', // Display the updated data
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle receiving data from the navigated screens
  Future<void> _handleNavigationWithData(
      BuildContext context, Widget screen) async {
    final result = await _navigateWithSlideAndFadeTransition(context, screen);
    if (result != null) {
      setState(() {
        updatedData = result; // Update the state with the returned data
      });
    }
  }

  // Function to handle custom slide and fade transitions with data
  Future<dynamic> _navigateWithSlideAndFadeTransition(
      BuildContext context, Widget screen) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var slideTween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

          return SlideTransition(
            position: animation.drive(slideTween),
            child: FadeTransition(
              opacity: animation.drive(fadeTween),
              child: child,
            ),
          );
        },
      ),
    );
  }
}

// A model class for Quick Access items
class QuickAccessItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  QuickAccessItem(
      {required this.title, required this.icon, required this.onTap});
}

// Updated list of Quick Access items with navigation logic and data passing
final List<QuickAccessItem> _quickAccessItems = [
  QuickAccessItem(
    title: 'Energy Tracking',
    icon: Icons.bolt,
    onTap: (context) {
      _navigateWithData(
          context,
          SustainabilityScreen(
              userId: 'user123', energyData: 'Sample Energy Data'));
    },
  ),
  QuickAccessItem(
    title: 'Carbon Tracking',
    icon: Icons.eco,
    onTap: (context) {
      _navigateWithData(context, CarbonTrackingScreen(carbonFootprint: 22.5));
    },
  ),
  QuickAccessItem(
    title: 'Emission Reduction',
    icon: Icons.reduce_capacity,
    onTap: (context) {
      _navigateWithData(context, EmissionReductionScreen(reductionGoals: 5));
    },
  ),
  QuickAccessItem(
    title: 'Waste Tracking',
    icon: Icons.delete,
    onTap: (context) {
      _navigateWithData(
          context, WasteTrackingScreen(wasteData: 'Weekly waste report'));
    },
  ),
];

// The QuickAccessCard widget used to display individual quick access items
class QuickAccessCard extends StatelessWidget {
  final QuickAccessItem item;

  QuickAccessCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => item.onTap(context), // Navigate to the respective screen
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 48.0, color: Colors.green), // Feature icon
              SizedBox(height: 16.0),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
