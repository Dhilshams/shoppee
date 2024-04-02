import 'package:flutter/material.dart';
import 'otp.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopWithIcon'),
        backgroundColor: Colors.blue, // Changing app bar background color
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue,Colors.lightBlueAccent, Colors.indigo,Colors.greenAccent], // Gradient background colors
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            Text(
              'Please enter your mobile number',
              style: TextStyle(fontSize: 16, color: Colors.white), // Text color
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your mobile number',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            SizedBox(height: 20), // Added padding between TextField and button
            Center( // Centering the button
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  OTPScreen()),
                    );// Add functionality for continue button
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey), // Button background color
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)), // Button padding
                  ),
                  child: Text('Continue'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Or "),
                    GestureDetector(
                      onTap: () {
                        // Add functionality for signup option
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("?"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
