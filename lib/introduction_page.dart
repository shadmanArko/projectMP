import 'package:flutter/material.dart';
import 'my_home_page.dart'; // Import the form page

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Person's name
            Text(
              'PROF. DR. PRAN GOPAL DATTA',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Person's picture
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/person_image.png'), // Replace with your image asset
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Start button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
              },
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
