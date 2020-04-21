import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class User {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  final databaseReference = Firestore.instance;

  String tmp;

  static const String SocialDrinking = 'cooking';
  static const String CasualDrinking = 'hiking';
  static const String HeavyDrinking = 'traveling';
  String firstName = '';
  String lastName = '';
  Map passions = {
    SocialDrinking: false,
    CasualDrinking: false,
    HeavyDrinking: false
  };

  Map data = {
    'dataFirstname': null,
    'dataLastname': '',
    'dataSocialdrinking' : false,
    'dataCsualdrinking' : false,
    'dataHeavydrinking' : false,
  };

  save() {
    print('Saving user using a web service');
    getCurrentUser();

    databaseReference.collection("user").document(firstName).snapshots().forEach((f) => print('${f.data}}'));

    databaseReference.collection("user").document(firstName).snapshots().forEach((f) => data = f.data);
    print(('dataFirstname' == null));

    print(data.containsValue(firstName));

    if (('dataFirstname' == null) == true)
      {
        _firestore.collection("user").document(firstName).setData({
          'firstname': firstName,
          'lastname': lastName,
          'socialdrinking' : passions.containsKey(SocialDrinking),
          'casualdrinking' : passions.containsKey(CasualDrinking),
          'heavydrinking' : passions.containsKey(HeavyDrinking),
        });
      }

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
}