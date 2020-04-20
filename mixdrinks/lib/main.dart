import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/drinks_widget.dart';
import 'package:mixdrinks/screens/home_screen.dart';
import 'package:mixdrinks/screens/welcome_screen.dart';
import 'package:mixdrinks/screens/login_screen.dart';
import 'package:mixdrinks/screens/registration_screen.dart';
import 'package:mixdrinks/screens/chat_screen.dart';

void main() => runApp(MixDrinks());

class MixDrinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // TODO: the following line of code does not work with the welcome, login, registration screens
          // brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        Home.id: (context) => Home(),
      },
    );
  }
}
