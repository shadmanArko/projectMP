import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'thank_you_page.dart'; // Import the thank you page
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textNameFieldController = TextEditingController();
  TextEditingController _textPhoneNumberFieldController =
      TextEditingController();
  TextEditingController _textUnionFieldController = TextEditingController();
  TextEditingController _textMessageFieldController = TextEditingController();
  final RegExp _phoneNumberRegExp = RegExp(r'^01[0-9]{9}$');
  int maxMessageLength = 5000;

  // Function to handle the submit button press
  void _handleSubmit() async {
    // Get the text from the text fields
    String field1 = _textNameFieldController.text;
    String field2 = _textPhoneNumberFieldController.text;
    String field3 = _textUnionFieldController.text;
    String field4 = _textMessageFieldController.text;

    // Define your Google Apps Script URL
    Uri scriptUrl = Uri.parse(
        "https://script.google.com/macros/s/AKfycbyacKRqFcIVQnk02V1cq2-jzk8EXZX_Q-40ZIaHhe6CLJA8nzgokeA1zhK1quFybF8oaQ/exec");

    // Make an HTTP POST request to your Google Apps Script
    var response = await http.post(scriptUrl, body: {
      'field1': field1,
      'field2': field2,
      'field3': field3,
      'field4': field4,
    });

    // Check the response from the script (you can handle success/failure here)
    if (response.statusCode == 200) {
      // Data submitted successfully, navigate to the thank you page
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ThankYouPage(),
      ));
    } else {
      // Error occurred (you can handle this as needed)
      print('Error submitting data: ${response.body}');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ThankYouPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: SingleChildScrollView(
        // Wrap the form in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _textNameFieldController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _textPhoneNumberFieldController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  } else if (!_phoneNumberRegExp.hasMatch(value)) {
                    return 'Invalid phone number format';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              TextField(
                controller: _textUnionFieldController,
                decoration: InputDecoration(labelText: 'Union'),
              ),
              TextField(
                controller: _textMessageFieldController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  hintText: 'Type your message here',
                ),
                maxLines: null, // Allows the field to expand as needed
                maxLength:
                    maxMessageLength, // Limits the text length to 5000 characters
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    _handleSubmit, // Call _handleSubmit when button is pressed
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textNameFieldController.dispose();
    _textPhoneNumberFieldController.dispose();
    _textUnionFieldController.dispose();
    _textMessageFieldController.dispose();
    super.dispose();
  }
}
