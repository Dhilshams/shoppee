import 'dart:async';
import 'package:flutter/material.dart';

import 'language.dart';// Import your language selection page file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the home page
      routes: {
        // Define a route for LanguageSelectionPage
        '/languageSelection': (context) => LanguageSelectionPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Define the duration of splash screen
  final splashDuration = 3; // in seconds

  // Define a function to navigate to the language selection page after splash duration
  void _navigateToLanguageSelection() {
    Navigator.of(context).pushReplacementNamed('/languageSelection');
  }

  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to language selection page after splash duration
    Timer(Duration(seconds: splashDuration), _navigateToLanguageSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color to blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Splash Screen Content',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set text color to white
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator( // Add a circular progress indicator
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Set indicator color to white
            ),
          ],
        ),
      ),
    );
  }
}
