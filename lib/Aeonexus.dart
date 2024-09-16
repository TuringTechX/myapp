// lib/Aeonexus.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:go_router/go_router.dart';

// Import all screens for Home
import 'screens/Home/HomeScreen.dart';
import 'screens/Home/PersonalizedFeedScreen.dart';
import 'screens/Home/QuickAccessScreen.dart';
import 'screens/Home/RealTimeUpdatesScreen.dart';
import 'screens/Home/KeyMetricsScreen.dart';

// Import Marketplace screens
import 'screens/Marketplace/MarketplaceScreen.dart';
import 'screens/Marketplace/MarketplaceItemScreen.dart';
import 'screens/Marketplace/CarbonFootprintScreen.dart';
import 'screens/Marketplace/InvestmentTrackerScreen.dart';
import 'screens/Marketplace/ProjectDetailsScreen.dart';

// Import Blockchain screens
import 'screens/Blockchain/BlockchainScreen.dart';
import 'screens/Blockchain/TransactionRecordScreen.dart';
import 'screens/Blockchain/ImpactReportingScreen.dart';
import 'screens/Blockchain/BlockchainStatusScreen.dart';
import 'screens/Blockchain/TransparencyOverviewScreen.dart';

// Import Sustainability screens
import 'screens/Sustainability/SustainabilityScreen.dart';
import 'screens/Sustainability/HabitTrackerScreen.dart';
import 'screens/Sustainability/SustainabilityChallengeScreen.dart';
import 'screens/Sustainability/ImpactMetricsScreen.dart';
import 'screens/Sustainability/SuggestionScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Pass all uncaught errors to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(AeonexusApp());
}

class AeonexusApp extends StatelessWidget {
  // Create an instance of Firebase Analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aeonexus Superapp',
      theme: ThemeData(
        primarySwatch: Colors.green, // Custom branding color
        brightness: Brightness.light, // Default to light mode
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Support for dark mode
        primarySwatch: Colors.green, // Custom branding in dark mode as well
      ),
      themeMode: ThemeMode.system, // Automatically switch based on system preference
      routerConfig: _router,
      navigatorObservers: <NavigatorObserver>[observer],
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      // Home Routes
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'personalized-feed',
            builder: (context, state) => PersonalizedFeedScreen(),
          ),
          GoRoute(
            path: 'quick-access',
            builder: (context, state) => QuickAccessScreen(),
          ),
          GoRoute(
            path: 'real-time-updates',
            builder: (context, state) => RealTimeUpdatesScreen(),
          ),
          GoRoute(
            path: 'key-metrics',
            builder: (context, state) => KeyMetricsScreen(),
          ),
        ],
      ),

      // Marketplace Routes
      GoRoute(
        path: '/marketplace',
        builder: (context, state) => MarketplaceScreen(),
        routes: [
          GoRoute(
            path: 'item',
            builder: (context, state) => MarketplaceItemScreen(),
          ),
          GoRoute(
            path: 'carbon-footprint',
            builder: (context, state) => CarbonFootprintScreen(),
          ),
          GoRoute(
            path: 'investment-tracker',
            builder: (context, state) => InvestmentTrackerScreen(),
          ),
          GoRoute(
            path: 'project-details',
            builder: (context, state) => ProjectDetailsScreen(),
          ),
        ],
      ),

      // Blockchain Routes
      GoRoute(
        path: '/blockchain',
        builder: (context, state) => BlockchainScreen(),
        routes: [
          GoRoute(
            path: 'transaction-record',
            builder: (context, state) => TransactionRecordScreen(),
          ),
          GoRoute(
            path: 'impact-reporting',
            builder: (context, state) => ImpactReportingScreen(),
          ),
          GoRoute(
            path: 'status',
            builder: (context, state) => BlockchainStatusScreen(),
          ),
          GoRoute(
            path: 'transparency-overview',
            builder: (context, state) => TransparencyOverviewScreen(),
          ),
        ],
      ),

      // Sustainability Routes
      GoRoute(
        path: '/sustainability',
        builder: (context, state) => SustainabilityScreen(),
        routes: [
          GoRoute(
            path: 'habit-tracker',
            builder: (context, state) => HabitTrackerScreen(),
          ),
          GoRoute(
            path: 'challenge',
            builder: (context, state) => SustainabilityChallengeScreen(),
          ),
          GoRoute(
            path: 'impact-metrics',
            builder: (context, state) => ImpactMetricsScreen(),
          ),
          GoRoute(
            path: 'suggestion',
            builder: (context, state) => SuggestionScreen(),
          ),
        ],
      ),

      // Add more routes for other sections like Climate Change, Community, etc.
    ],
  );
}
