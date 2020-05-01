import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/drink_search_screen.dart';
import 'package:mixdrinks/screens/profile_screen.dart';

import 'user_ingredients_screen.dart';

// initializes 3 widgets to show up on the drinks_search page for easy navigation
class Home extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DrinkSearch(),
    UserIngredients(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3CC79),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            title: Text('Mix Drinks'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'))
        ],
      ),
    );
  }

  // moves to a different tab on the bottom search bar to the clicked on tab
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
