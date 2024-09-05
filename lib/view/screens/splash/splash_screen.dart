import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
    _route();
  }

  void _loadRiveFile() {
    rootBundle.load('assets/aeonexus_splash.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation('Animation 1'));
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  void _route() {
    Timer(const Duration(seconds: 5), () {
      // Navigate to the next screen after the splash screen
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated sunrise background using SimpleAnimation
          Positioned.fill(
            child: CustomBackgroundAnimation(),
          ),
          // Rive animation (Globe with data streams)
          Center(
            child: _riveArtboard == null
                ? const CircularProgressIndicator()
                : GlowWidget(
                    // Add a glowing effect around the globe
                    glowColor: Colors.blueAccent,
                    glowRadius: 20,
                    child: Rive(
                      artboard: _riveArtboard,
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
          // SVG of people connected by lines of light
          Positioned.fill(
            child: CustomPaint(
              painter: PeopleAndConnectionsPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom background animation for sunrise using simple_animations
class CustomBackgroundAnimation extends StatelessWidget {
  const CustomBackgroundAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MirrorAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1), // Sunrise effect
      duration: const Duration(seconds: 5),
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.orange.withOpacity(value),
                Colors.yellow.withOpacity(value),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        );
      },
    );
  }
}

// Custom painter for drawing people and connecting lines of light
class PeopleAndConnectionsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw people (represented as circles here)
    Offset person1 = Offset(size.width * 0.2, size.height * 0.7);
    Offset person2 = Offset(size.width * 0.8, size.height * 0.7);
    Offset person3 = Offset(size.width * 0.5, size.height * 0.5);

    // Draw connecting lines (representing global collaboration)
    canvas.drawLine(person1, person3, paint);
    canvas.drawLine(person2, person3, paint);

    // Draw people (circles)
    canvas.drawCircle(person1, 15, paint..color = Colors.greenAccent);
    canvas.drawCircle(person2, 15, paint..color = Colors.blueAccent);
    canvas.drawCircle(person3, 20, paint..color = Colors.yellowAccent);

    // Add glowing effect around the connection lines
    canvas.drawCircle(
        person1, 30, paint..color = Colors.greenAccent.withOpacity(0.5));
    canvas.drawCircle(
        person2, 30, paint..color = Colors.blueAccent.withOpacity(0.5));
    canvas.drawCircle(
        person3, 40, paint..color = Colors.yellowAccent.withOpacity(0.5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Glow effect around the Rive animation
class GlowWidget extends StatelessWidget {
  final Widget child;
  final Color glowColor;
  final double glowRadius;

  const GlowWidget({Key key, this.child, this.glowColor, this.glowRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: glowColor,
      glowRadius: glowRadius,
      child: child,
    );
  }
}
