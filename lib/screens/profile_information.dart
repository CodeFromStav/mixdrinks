import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mixdrinks/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mixdrinks/components/user.dart';

class ProfileInformation extends StatefulWidget {
  @override
  _ProfileInformationState createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'First name'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.firstName = val),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Last name'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your last name.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.lastName = val)),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: const Text('Social Drinking?'),
                                value: _user.passions[User.SocialDrinking],
                                onChanged: (val) {
                                  setState(() =>
                                      _user.passions[User.SocialDrinking] = val);
                                }),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: const Text('Casual Drinking?'),
                                value: _user.passions[User.CasualDrinking],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.CasualDrinking] = val);
                                }),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: const Text('Drink Connoisseur?'),
                                value: _user.passions[User.ConnoisseurDrinking],
                                onChanged: (val) {
                                  setState(() =>
                                      _user.passions[User.ConnoisseurDrinking] = val);
                                }),
                          ),
                          Expanded(
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: RaisedButton(
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        _user.save();
                                        _showDialog(context);
                                      }
                                    },
                                    child: Text('Save'))),
                          ),
                        ])))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
