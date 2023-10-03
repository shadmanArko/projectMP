import 'package:flutter/material.dart';
import 'my_home_page.dart'; // Import the form page
import 'introduction_page.dart'; // Import the introduction page
import 'thank_you_page.dart'; // Import the thank you page

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      initialRoute: '/', // Set the initial route to the introduction page
      routes: {
        '/': (context) => IntroductionPage(), // Introduction Page
        '/form': (context) => MyHomePage(), // Form Page
        '/thankyou': (context) => ThankYouPage(), // Thank You Page
      },
    );
  }
}
