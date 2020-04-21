import 'package:flutter/material.dart';
import 'package:testapp/drink_search.dart';
import 'drink_details.dart';

class DrinkInfo extends StatefulWidget {
  static const String id = 'drink_info';
  @override
  _DrinkInfoState createState() => new _DrinkInfoState();
}

class _DrinkInfoState extends State<DrinkInfo> {

  @override
  Widget build(BuildContext context) {
    final DrinkDetails args = ModalRoute.of(context).settings.arguments;
    List<String> formatIngredients = new List<String>();
    formatIngredients = removeBrackets(args.ingredients.toString()).split("unit");
      return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.name),
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, DrinkSearch.id);
              },
            ),
            bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: "Glass"),
                  Tab(text: "Category"),
                  Tab(text: "Ingredients"),
                  Tab(text: "Preparation"),
                ]
            ),
          ),
          body: TabBarView(
              children: [
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(args.glass.toString()),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(args.category.toString()),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Row>[
                      getTextWidgets(formatIngredients),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(args.preparation.toString()),
                    ],
                  ),
                ),
              ]
          ),
        )
      ),
    );
  }
}
String removeBrackets(String inStr) {
  return inStr
      .replaceAll("(", "")
      .replaceAll(")", "")
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll("{", "")
      .replaceAll("}", "");
}
Widget getTextWidgets(List<String> strings)
{
  return new Row(children: strings.map((item) => new Text(item)).toList());
}