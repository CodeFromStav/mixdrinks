import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mixdrinks/constants.dart';
import 'package:mixdrinks/screens/profile_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mixdrinks/screens/login_screen.dart';
import 'package:mixdrinks/screens/user_ingredients.dart';
import 'package:mixdrinks/components/user.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

String firstName;

class ProfileWidget extends StatelessWidget {
  static const String id = 'profile_screen';
  final _auth = FirebaseAuth.instance;

  void printText(text) {
    print(text);
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            getUserName(),
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Color.fromRGBO(0, 0, 50, 100),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileInformation()));
            },
            child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    'Account Information',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 50, 100),
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                )),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserIngredients()));
            },
            child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    'My Ingredients',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(0, 0, 50, 100),
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 50, 100),
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  String getUserName() {
    String firstNameTemp = "Anonymous";
    String lastNameTemp = "User";
    String combinedName;

    if (loggedInUser != null) {
      firstNameTemp = User().getFirstName(loggedInUser.uid);
      lastNameTemp = User().getLastName(loggedInUser.uid);
    }

    if (firstNameTemp == null) {
      firstNameTemp = "Anonymous";
    }

    if (lastNameTemp == null) {
      firstNameTemp = "User";
    }

    combinedName = firstNameTemp + " " + lastNameTemp;

    return combinedName;
  }
}
