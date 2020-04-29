import 'package:flutter/material.dart';
import 'package:mixdrinks/components/user.dart';

// Profile information page where user information is entered
class ProfileInformation extends StatefulWidget {
  @override
  _ProfileInformationState createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  // Create key for each user form
  final _formKey = GlobalKey<FormState>();
  // Create user object to store user information
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Create app bar
        appBar: AppBar(title: Text('Profile')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: Builder(
                // Create a form for user information
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            // Allow user to enter their first name
                            // Includes a validator to ensure that something is
                            //      entered
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'First name'),
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                              },
                              // Set user entered information using user object
                              onSaved: (val) =>
                                  setState(() => _user.firstName = val),
                            ),
                          ),
                          Expanded(
                            // Allow user to enter their last name
                            child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Last name'),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your last name.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.lastName = val)),
                          ),
                          Expanded(
                            // SwitchListTile to allow user to set whether they
                            //    are social drinker or not
                            child: SwitchListTile(
                                title: const Text('Are you a social drinker?'),
                                value: _user.passions[User.SocialDrinking],
                                secondary: const Icon(Icons.person),
                                // Information is saved to user page
                                onChanged: (val) {
                                  setState(() =>
                                      _user.passions[User.SocialDrinking] = val);
                                }),
                          ),
                          Expanded(
                            // SwitchListTile to allow user to set whether they
                            //    are casual drinker or not
                            child: SwitchListTile(
                                title: const Text('Are you a casual drinker?'),
                                value: _user.passions[User.CasualDrinking],
                                secondary: const Icon(Icons.person),
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.CasualDrinking] = val);
                                }),
                          ),
                          Expanded(
                            // SwitchListTile to allow user to set whether they
                            //    are heavy drinker or not
                            child: SwitchListTile(
                                title: const Text('Are you a heavy drinker?'),
                                value: _user.passions[User.HeavyDrinking],
                                secondary: const Icon(Icons.person),
                                onChanged: (val) {
                                  setState(() =>
                                      _user.passions[User.HeavyDrinking] = val);
                                }),
                          ),
                          Expanded(
                            // Save button
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: RaisedButton(
                                    onPressed: () {
                                      // Update form to be equal to current state
                                      final form = _formKey.currentState;
                                      // If form is valid...
                                      if (form.validate()) {
                                        // Save the form
                                        form.save();
                                        // Use save function in User.dart so
                                        //    that user's information is saved
                                        _user.save();
                                        // Display save confirmation
                                        _showDialog(context);
                                      }
                                    },
                                    child: Text('Save'))),
                          ),
                        ])))));
  }

  // Function to show confirmation when user hit's save button
  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
