import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OTPScreen(),
    );
  }
}

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _controllers = [];
  String otp = '';

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode>.generate(5, (index) => FocusNode());
    _controllers = List<TextEditingController>.generate(
        5, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'OTP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Please enter your OTP here',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: 50.0,
                  height: 50.0,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (value) {
                      if (value.length == 1 && index < 4) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.length == 0 && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                      setState(() {
                        otp = '';
                        for (int i = 0; i < 5; i++) {
                          otp += _controllers[i].text;
                        }
                      });
                    },
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counter: Offstage(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Here you can implement your logic to verify OTP
                print('Entered OTP: $otp');
              },
              child: Text('Verify'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Implement logic to resend OTP
                print('Resend OTP');
              },
              child: Text(
                "Didn't receive OTP? Resend OTP",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
