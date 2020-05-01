import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/drink_info_screen.dart';
import 'package:mixdrinks/screens/drink_search_screen.dart';
import 'package:mixdrinks/screens/brewing_screen.dart';
import 'package:mixdrinks/screens/home_screen.dart';
import 'package:mixdrinks/screens/profile_information_screen.dart';
import 'package:mixdrinks/screens/profile_screen.dart';
import 'package:mixdrinks/screens/welcome_screen.dart';
import 'package:mixdrinks/screens/login_screen.dart';
import 'package:mixdrinks/screens/registration_screen.dart';

// Run the app
void main() => runApp(MixDrinks());

class MixDrinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the theme data used by the app
      theme: ThemeData(
          primaryColor: Color(0xFFE5B143),
      ),
      // Set the initial route
      initialRoute: WelcomeScreen.id,
      // Set the routes for each of the pages
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Home.id: (context) => Home(),
        DrinkSearch.id: (context) => DrinkSearch(),
        BrewingScreen.id: (context) => BrewingScreen(),
        DrinkSearch.id: (context) => DrinkSearch(),
        DrinkInfo.id: (context) => DrinkInfo(),
        ProfileScreen.id: (context) => ProfileScreen(),
        ProfileInformation.id: (context) => ProfileInformation(),
      },
    );
  }
}
