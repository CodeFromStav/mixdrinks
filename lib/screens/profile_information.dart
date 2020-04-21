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
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text('Subscribe'),
                            ),
                          ),
                          Expanded(
                            child: SwitchListTile(
                                title: const Text('Monthly Newsletter'),
                                value: _user.newsletter,
                                onChanged: (bool val) =>
                                    setState(() => _user.newsletter = val)),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text('Interests'),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: const Text('Cooking'),
                                value: _user.passions[User.PassionCooking],
                                onChanged: (val) {
                                  setState(() =>
                                      _user.passions[User.PassionCooking] = val);
                                }),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: const Text('Traveling'),
                                value: _user.passions[User.PassionTraveling],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.PassionTraveling] = val);
                                }),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                title: const Text('Hiking'),
                                value: _user.passions[User.PassionHiking],
                                onChanged: (val) {
                                  setState(() =>
                                      _user.passions[User.PassionHiking] = val);
                                }),
                          ),
                          Expanded(
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
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
