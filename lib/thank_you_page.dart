import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thank You',
          style: TextStyle(
            color: Colors.white, // Change the text color to white
          ),
        ),
        backgroundColor: Color.fromRGBO(
            66, 165, 245, 1), // Change the app bar background color
      ),
      body: Container(
        color: Colors.white, // Change the background color of the body
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                color: Color.fromRGBO(
                    66, 165, 245, 1), // Change the icon color to green
                size: 80.0, // Increase the icon size
              ),
              SizedBox(height: 20),
              Text(
                'Thank you for your message!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Apply bold font style
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We have received your message and will get back to you soon.',
                textAlign: TextAlign.center, // Center-align the text
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // Change the text color to grey
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back to the form page
                },
                child: Text('Back to Form'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(
                      66, 165, 245, 1), // Change the button color to teal
                  onPrimary:
                      Colors.white, // Change the button text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
