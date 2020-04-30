// The code for WelcomeScreen was originally sourced from the "londonappbrewery"
//    github repo
// Source: https://github.com/londonappbrewery/Flash-Chat-Flutter-Complete

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mixdrinks/components/rounded_button.dart';
import 'package:mixdrinks/screens/login_screen.dart';
import 'package:mixdrinks/screens/registration_screen.dart';

/// Class for showing the first screen when the user starts up the app
class WelcomeScreen extends StatefulWidget {
  /// Setting the id for the screen to be used when constructing routes
  static const String id = 'welcome_screen';

  // Creating a state for the _WelcomeScreenState
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  /// Animation variables to handle the text animation
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller with the duration of 1 second
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    // Change the color of the animation
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    // Start the animation of the animation
    controller.forward();
    // Create a listener for the controller so that it start with the page
    controller.addListener(() {
      setState(() {});
    });
  }

  // Release the resources used by this animation
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Make the background color equal to the color value associated with the
      //    animation object
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // Create drink logo
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo3.png'),
                    height: 85.0,
                  ),
                ),
                // Add kit to for use with animation
                TypewriterAnimatedTextKit(
                  text: ['Mix Drinks'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // Button for user to press to move to login screen
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            // Button for user to press to move to registration screen
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
