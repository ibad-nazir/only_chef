import 'package:flutter/material.dart';
import 'dart:async';
import 'package:only_shef/pages/login_sign/login_or_signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Animation duration for slide and fade
      vsync: this,
    );

    // Define the sliding animation from top to center
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1), // Start from top
      end: Offset(0, 0),    // End at the center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Animation curve
    ));

    // Define the fade-out animation
    _fadeAnimation = Tween<double>(
      begin: 1.0, // Start fully visible
      end: 0.0,   // End fully transparent
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Animation curve
    ));

    // Start the slide animation
    _controller.forward();

    // After the slide animation is complete, wait for the logo to stay visible for a moment before fading out
    Timer(Duration(seconds: 2), () {
      _controller.reverse(); // Start fade-out after the slide is done
    });

    // Navigate to the home screen after the fade-out completes
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginOrSignup()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC1BFC1), // Set splash screen background color
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation, // Apply fade-out transition
          child: SlideTransition(
            position: _slideAnimation, // Apply slide-in transition
            child: Image.asset(
              'assets/logo.png', // Replace with your image path
              width: 300, // Set the width of the image
              height: 300, // Set the height of the image
            ),
          ),
        ),
      ),
    );
  }
}
