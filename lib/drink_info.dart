import 'package:flutter/material.dart';
import 'package:testapp/drink_search.dart';

class DrinkInfo extends StatefulWidget {
  static const String id = 'drink_info';
  @override
  _DrinkInfoState createState() => new _DrinkInfoState();
}

class _DrinkInfoState extends State<DrinkInfo> {

  @override
  Widget build(BuildContext context) {
    final DrinkDetails args = ModalRoute.of(context).settings.arguments;
    return Scaffold();
  }
}