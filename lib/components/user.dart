import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class User {
  final _firestore = Firestore.instance;

  FirebaseUser loggedInUser;
  final _auth = FirebaseAuth.instance;

  static String firstNameTemp;
  static String lastNameTemp;

  static const String SocialDrinking = 'socialDrinking';
  static const String CasualDrinking = 'casualDrinking';
  static const String HeavyDrinking = 'heavyDrinking';
  String firstName = '';
  String lastName = '';
  Map passions = {
    SocialDrinking: false,
    CasualDrinking: false,
    HeavyDrinking: false
  };

  save() {
    print('Saving user using a web service');

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        setFirestoreData(loggedInUser.uid);
      }
    } catch (e) {
      print(e);
    }
  }

  void setFirestoreData(String userID) {
    _firestore.collection("user").document(userID).setData({
      'userid': loggedInUser.uid,
      'firstname': firstName,
      'lastname': lastName,
      'socialdrinking': passions[SocialDrinking],
      'casualdrinking': passions[CasualDrinking],
      'heavydrinking': passions[HeavyDrinking],
    });
  }

  String getFirstName(String userID) {
    _firestore
        .collection("user")
        .document(userID)
        .snapshots()
        .forEach((f) => returnFirstName(f.data['firstname']));

    return firstNameTemp;
  }

  void returnFirstName(String first)
  {
    firstNameTemp = first;
  }

  String getLastName(String userID) {
    _firestore
        .collection("user")
        .document(userID)
        .snapshots()
        .forEach((f) => returnLastName(f.data['lastname']));

    return lastNameTemp;
  }

  void returnLastName(String last)
  {
    lastNameTemp = last;
  }


}

