import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Class that is used to store the information associated with a user's
//    profile information page
class User {
  // Creating a firestore instance to add and grab information from the
  //    firestore cloud
  final _firestore = Firestore.instance;

  // Creating a firebase user object to grab the unique id associated to a user
  FirebaseUser loggedInUser;
  final _auth = FirebaseAuth.instance;

  // Temp variables associated to the user's information
  // These variables are used in the get functions
  static String firstNameTemp;
  static String lastNameTemp;
  static String socialDrinkingTemp;
  static String casualDrinkingTemp;
  static String heavyDrinkingTemp;

  // Variables that are set and used in the profile information page
  static const String SocialDrinking = 'socialDrinking';
  static const String CasualDrinking = 'casualDrinking';
  static const String HeavyDrinking = 'heavyDrinking';
  String firstName = '';
  String lastName = '';

  // Map object to store the information associated with a user's passion
  Map passions = {
    SocialDrinking: false,
    CasualDrinking: false,
    HeavyDrinking: false
  };

  // Save functionality that is "activated" when the user saves on the
  //    profile information page
  save() {
    print('Saving user using a web service');

    getCurrentUser();
  }

  // Retrieve the current user using the app
  // Information is tied to login information
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        // Storing user to firebaseuser variable
        loggedInUser = user;

        // Call function to store firestore information in firestore cloud
        setFirestoreData(loggedInUser.uid);
      }
    } catch (e) {
      print(e);
    }
  }

  // Store firestore information in firestore cloud
  void setFirestoreData(String userID) {

    // Collection is named 'user' while the document where user specific
    //    information is stored is named after the user's unique id
    _firestore.collection("user").document(userID).setData({
      'userid': loggedInUser.uid,
      'firstname': firstName,
      'lastname': lastName,
      'socialdrinking': passions[SocialDrinking],
      'casualdrinking': passions[CasualDrinking],
      'heavydrinking': passions[HeavyDrinking],
    });
  }

  // Grab the first name of the user from the firestore cloud collection
  String getFirstName(String userID) {
    _firestore
        .collection("user")
        .document(userID)
        .snapshots()
        // One way to iterate through snapshots is by using the forEach functionality
        // However, this functionality is unable to set variable names within
        //    its call
        // As such, we pass the information to a function that is able to
        //    to set a temp variable that can be returned
        .forEach((f) => returnFirstName(f.data['firstname']));

    return firstNameTemp;
  }

  // Helper function for getFirstName
  void returnFirstName(String first)
  {
    firstNameTemp = first;
  }

  // Return user's drinking passion
  String getLastName(String userID) {
    _firestore
        .collection("user")
        .document(userID)
        .snapshots()
        .forEach((f) => returnLastName(f.data['lastname']));

    return lastNameTemp;
  }

  // Helper function for returnLastName
  void returnLastName(String last)
  {
    lastNameTemp = last;
  }

  // Return user's drinking passion
  String getSocialDrinker(String userID) {
    _firestore
        .collection("user")
        .document(userID)
        .snapshots()
        .forEach((f) => returnSocialDrinker((f.data['socialdrinking']).toString()));

    return socialDrinkingTemp;
  }

  // Helper function for returnSocialDrinker
  void returnSocialDrinker(String socialDrinker)
  {
    socialDrinkingTemp = socialDrinker;
  }

  // Return user's drinking passion
  String getCasualDrinker(String userID) {
    _firestore
        .collection("user")
        .document(userID)
        .snapshots()
        .forEach((f) => returnCasualDrinker((f.data['casualdrinking']).toString()));

    return casualDrinkingTemp;
  }

  // Helper function for returnCasualDrinker
  void returnCasualDrinker(String casualDrinker)
  {
    casualDrinkingTemp = casualDrinker;
  }

  // Return user's drinking passion
  String getHeavyDrinker(String userID) {
    _firestore
        .collection("user")
        .document(userID)
        .snapshots()
        .forEach((f) => returnHeavyDrinker((f.data['heavydrinking']).toString()));

    return heavyDrinkingTemp;
  }

  // Helper function for returnHeavyDrinker
  void returnHeavyDrinker(String heavyDrinker)
  {
    heavyDrinkingTemp = heavyDrinker;
  }

}

