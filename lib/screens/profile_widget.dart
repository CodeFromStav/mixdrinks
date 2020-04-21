import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  static const String id = 'profile_screen';
  void printText(text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/profile_avatar.jpg'),
          ),
          Text(
            'User Name',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          FlatButton(
            onPressed: () {
              printText('button1 pressed');
            }, //TODO: Add Account Information Page
            child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    'Account Information',
                    style: TextStyle(
                      color: Colors.teal.shade100,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                )),
          ),
          FlatButton(
            onPressed: () {
              printText('button2 pressed');
            }, //TODO: Add Ingredients List Page
            child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    'My Ingredients',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade100,
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
