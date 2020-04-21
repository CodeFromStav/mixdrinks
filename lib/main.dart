import 'package:flutter/material.dart';
import 'drink_info.dart';
import 'drink_search.dart';
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
      initialRoute: DrinkSearch.id,
      routes: {
        DrinkSearch.id: (context) => DrinkSearch(),
        DrinkInfo.id: (context) => DrinkInfo(),
      },
    );
  }
}