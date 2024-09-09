// lib/Aeonexus.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Pass all uncaught errors to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create an instance of Firebase Analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aeonexus Superapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: HomeScreen(),
    );
  }
}
