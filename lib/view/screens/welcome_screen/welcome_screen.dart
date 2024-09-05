import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Assuming Aeonexus uses custom widgets, e.g., logo.
import 'package:aeonexus/widgets/custom_logo.dart';
import 'package:aeonexus/util/app_styles.dart';  // Custom styling for Aeonexus
import 'package:aeonexus/util/dimensions.dart';  // Custom dimensions

class WelcomeScreen extends StatefulWidget {
  final String phoneNumber;
  final String countryCode;
  final String password;

  const WelcomeScreen({
    Key? key, required this.phoneNumber, required this.countryCode, required this.password,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    _authenticateUser(widget.phoneNumber, widget.password);
  }

  // Authenticate the user using Firebase Authentication
  Future<void> _authenticateUser(String phone, String password) async {
    try {
      // Using Firebase's phone authentication, assuming phone auth method
      FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signInWithPhoneNumber(phone);  // Modify this based on your authentication flow

      // On successful authentication, navigate to the home page
      GoRouter.of(context).go('/home');
    } catch (e) {
      // Handle the error by showing a dialog or logging
      print("Error during authentication: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: size.height * 0.7,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_EXTRA_LARGE),
            bottomRight: Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_EXTRA_LARGE),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomLogo(height: 90, width: 90),  // Custom Logo Widget for Aeonexus
            const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            
            // Welcome text using Google Fonts
            Text(
              'Welcome to Aeonexus',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            
            // Introductory message using Google Fonts
            Text(
              'Start exploring the amazing ways to enhance your lifestyle through Aeonexus!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1?.color,
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
          ],
        ),
      ),
    );
  }
}
