import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase import
import 'package:shared_preferences/shared_preferences.dart'; // Example for shared preferences

import 'splash_screen.dart'; // Import the splash screen file
import 'firebase_options.dart'; // Firebase options file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Ensure you have firebase_options.dart from Firebase CLI
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Example provider for SharedPreferences
        ChangeNotifierProvider(
          create: (_) => MyAppState(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Aeonexus Superapp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.poppinsTextTheme(), // Using Google Fonts
          useMaterial3: true,
        ),
        routerConfig: _router, // GoRouter configuration
      ),
    );
  }
}

// GoRouter configuration for navigation
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'HomePage',
      builder: (context, state) => MyHomePage(title: 'Home Page'),
    ),
  ],
);

// Example state management for MyAppState
class MyAppState extends ChangeNotifier {
  // You can store global states, user preferences, etc., here
  SharedPreferences? _prefs;

  MyAppState() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  // Example: Getter for a preference
  String get exampleValue => _prefs?.getString('exampleKey') ?? 'Default Value';
}

// Home page (can be customized further)
class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
