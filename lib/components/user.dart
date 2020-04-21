import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class User {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  static DatabaseReference mDatabase;

  static const String SocialDrinking = 'cooking';
  static const String CasualDrinking = 'hiking';
  static const String ConnoisseurDrinking = 'traveling';
  String firstName = '';
  String lastName = '';
  Map passions = {
    SocialDrinking: false,
    CasualDrinking: false,
    ConnoisseurDrinking: false
  };
  save() {
    print('Saving user using a web service');
    getCurrentUser();

    

    _firestore.collection('user').add({
      'firstname': firstName,
      'lastname': lastName,
      'socialdrinking' : passions.containsKey(SocialDrinking),
      'casualdrinking' : passions.containsKey(CasualDrinking),
      'drinkconnoisseur' : passions.containsKey(ConnoisseurDrinking),
    });
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