import 'package:flutter/material.dart';
import 'login.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguage = 'English'; // Default selected language

  // Define a list of supported languages with their flags
  final List<Map<String, dynamic>> languages = [
    {'name': 'English', 'flag': '🇺🇸'},
    {'name': 'Spanish', 'flag': '🇪🇸'},
    {'name': 'French', 'flag': '🇫🇷'},
    {'name': 'Malayalam', 'flag': '🇮🇳'}, // Added Malayalam language
    {'name': 'Arabic', 'flag': '🇸🇦'}, // Added Arabic language
    // Add more languages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selection'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Language:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: languages.map<DropdownMenuItem<String>>((Map<String, dynamic> language) {
                return DropdownMenuItem<String>(
                  value: language['name'],
                  child: Row(
                    children: [
                      Text(language['flag']),
                      SizedBox(width: 10),
                      Text(language['name']),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle language selection here
                // For now, navigate to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
