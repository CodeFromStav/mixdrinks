import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/profile_information_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mixdrinks/screens/login_screen.dart';
import 'package:mixdrinks/screens/user_ingredients.dart';
import 'package:mixdrinks/components/user.dart';

/// Creating a firebase user object to grab the unique id associated to a user
FirebaseUser loggedInUser;

/// Class for displaying profile screen to user
class ProfileWidget extends StatelessWidget {
  /// Set screen's id for page navigation
  static const String id = 'profile_screen';

  /// Create firebase instance
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Retrieve current user and set equal to firebase loggedInUser
    getCurrentUser();
    return SafeArea(
      // Set up a column to hold information on the page
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Display
          Text(
            // Get username from firestore cloud
            //    userName = first name + last name
            getUserName(),
            // Set user name to screen
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Create divider between between text boxes
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Color.fromRGBO(0, 0, 50, 100),
            ),
          ),
          // Get social drinker passion from user information
          Text(
            getSocialDrinker(),
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Create divider between between text boxes
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Color.fromRGBO(0, 0, 50, 100),
            ),
          ),
          // Get casual drinker passion from user information
          Text(
            getCasualDrinker(),
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Create divider between between text boxes
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Color.fromRGBO(0, 0, 50, 100),
            ),
          ),
          // Get heavy drinker passion from user information
          Text(
            getHeavyDrinker(),
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Create divider between between text boxes
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Color.fromRGBO(0, 0, 50, 100),
            ),
          ),
          // Button for directing user to profile information
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileInformation()));
            },
            child: Card(
                // Display card associated to profile information page
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  // Text displayed to user
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
          // Button for directing user to ingredients page
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserIngredients()));
            },
            child: Card(
                // Display card associated to ingredients page
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
          // Button for directing user to login page
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Card(
                // Display card associated to signing out
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

  // Retrieve the current user using the app
  // Information is tied to login information
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {

        // Storing user to firebaseuser variable
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  // Get first name and last name from firestore cloud, combine them
  //    and then return as the username

  String getUserName() {
    // Temp variables
    String firstNameTemp = "Anonymous";
    String lastNameTemp = "User";
    String combinedName;

    // Set temp variables equal to information stored in firestore cloud
    if (loggedInUser != null) {
      firstNameTemp = User().getFirstName(loggedInUser.uid);
      lastNameTemp = User().getLastName(loggedInUser.uid);
    }

    // If the loggedInUser var is null, we can't grab the uid
    //      So set lastNameTemp equal to user
    if (firstNameTemp == null) {
      firstNameTemp = "Anonymous";
    }

    // If the loggedInUser var is null, we can't grab the uid
    //      So set lastNameTemp equal to user
    if (lastNameTemp == null) {
      lastNameTemp = "User";
    }

    // Combine strings with space in between
    combinedName = firstNameTemp.trim() + " " +
        lastNameTemp.trim();

    return combinedName;
  }

  // Get social drinker status
  String getSocialDrinker() {
    // Temp variable
    String socialDrinkerTemp = "Not Answered Yet";

    // Get drinking passion based on user firestore information
    if (loggedInUser != null) {
      socialDrinkerTemp = User().getSocialDrinker(loggedInUser.uid);

      // Check whether true or false and return appropriate response
      if (socialDrinkerTemp == "true")
        {
          socialDrinkerTemp = "I am a Social Drinker!";
        }
      else
        {
          socialDrinkerTemp = "I am not a Social Drinker!";
        }
    }

    // If user hasn't entered information for passion yet
    if (socialDrinkerTemp == null) {
      socialDrinkerTemp = "Not Answered Yet";
    }

    return socialDrinkerTemp;
  }

  // Get casual drinker status
  String getCasualDrinker() {
    String casualDrinkingTemp = "Not Answered Yet";

    // Get drinking passion based on user firestore information
    if (loggedInUser != null) {
      casualDrinkingTemp = User().getCasualDrinker(loggedInUser.uid);

      // Check whether true or false and return appropriate response
      if (casualDrinkingTemp == "true")
      {
        casualDrinkingTemp = "I am a Casual Drinker!";
      }
      else
      {
        casualDrinkingTemp = "I am not a Casual Drinker!";
      }
    }

    // If user hasn't entered information for passion yet
    if (casualDrinkingTemp == null) {
      casualDrinkingTemp = "Not Answered Yet";
    }

    return casualDrinkingTemp;
  }

  // Get heavy drinker status
  String getHeavyDrinker() {
    String heavyDrinkingTemp = "Not Answered Yet";

    // Get drinking passion based on user firestore information
    if (loggedInUser != null) {
      heavyDrinkingTemp = User().getHeavyDrinker(loggedInUser.uid);

      // Check whether true or false and return appropriate response
      if (heavyDrinkingTemp == "true")
      {
        heavyDrinkingTemp = "I am a Heavy Drinker!";
      }
      else
      {
        heavyDrinkingTemp = "I am not a Heavy Drinker!";
      }
    }

    // If user hasn't entered information for passion yet
    if (heavyDrinkingTemp == null) {
      heavyDrinkingTemp = "Not Answered Yet";
    }

    return heavyDrinkingTemp;
  }
}
