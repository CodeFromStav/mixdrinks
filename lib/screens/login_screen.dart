// The code for LoginScreen was originally sourced from the "londonappbrewery"
//    github repo
// Source: https://github.com/londonappbrewery/Flash-Chat-Flutter-Complete

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mixdrinks/components/rounded_button.dart';
import 'package:mixdrinks/constants.dart';
import 'package:mixdrinks/screens/home_screen.dart';

// Class for handling where the user will login in with a registered account
class LoginScreen extends StatefulWidget {
  // Setting the id for the screen to be used when constructing routes
  static const String id = 'login_screen';

  // Creating a state for the _LoginScreenState
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Create firebase instance
  final _auth = FirebaseAuth.instance;

  // Boolean for handling whether to show spinner or not
  bool showSpinner = false;

  // Storing the user's email and password that will be used to make a user
  //    account with firebase
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
                // Set local variable to user input
                onChanged: (value) {
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
              // Button that is used to log in a user with firebase
              RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  // Show spinner while user information is accessed
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    // Create user object with email and password supplied
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    // Push user to home page if information was OK
                    if (user != null) {
                      Navigator.pushNamed(context, Home.id);
                    }
                    // Set spinner back to false
                    setState(() {
                      showSpinner = false;
                    });
                    // Print error if user account was unable to be loaded
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
