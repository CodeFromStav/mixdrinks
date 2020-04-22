import 'package:flutter/material.dart';
import 'package:mixdrinks/components//search_widget.dart';
import 'package:mixdrinks/screens/drink_search.dart';
import 'package:mixdrinks/screens/drinks_widget.dart';
import 'package:mixdrinks/screens/profile_widget.dart';
import 'package:mixdrinks/screens/user_ingredients.dart';

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
    DrinksWidget(),
    ProfileWidget()
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
            icon: Icon(Icons.local_bar),
            title: Text('Drinks'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'))
        ],
      ),
    );



  }



  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}