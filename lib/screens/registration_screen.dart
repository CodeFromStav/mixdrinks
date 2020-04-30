// The code for RegistrationScreen was originally sourced from the "londonappbrewery"
//    github repo
// Source: https://github.com/londonappbrewery/Flash-Chat-Flutter-Complete

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mixdrinks/components/rounded_button.dart';
import 'package:mixdrinks/constants.dart';
import 'package:mixdrinks/screens/home_screen.dart';

/// Class for handling where the user can register a new account
class RegistrationScreen extends StatefulWidget {
  /// Setting the id for the screen to be used when constructing routes
  static const String id = 'registration_screen';

  // Creating a state for the _RegistrationScreenState
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  /// Create firebase instance
  final _auth = FirebaseAuth.instance;

  /// Boolean for handling whether to show spinner or not
  bool showSpinner = false;

  /// Storing the user's email and password that will be used to make a user
  ///    account with firebase
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Progress HUD for use with spinner
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                // Display drinks logo
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo3.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              // Text field for user to enter email address for their account
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // Set local variable to user input
                  email = value;
                },
                // Hint for user to know what to enter in text field
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              // Text field for user to enter the password for their account
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // Set local variable to user input
                  password = value;
                },
                // Hint for user to know what to enter in text field
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              // Button that is used to create a new user with firebase
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () async {
                  // Show spinner while user information is registered
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    // Create new user with information
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email.trim(), password: password);
                    // Push user to home page if information was OK
                    if (newUser != null) {
                      Navigator.pushNamed(context, Home.id);
                    }
                    // Set spinner back to false
                    setState(() {
                      showSpinner = false;
                    });
                    // Print error if user account was unable to be made
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
