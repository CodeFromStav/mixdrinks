import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/drink_search.dart';
import 'package:mixdrinks/components/drink_details.dart';

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
    //print(formatIngredients.toString());
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Text(args.glass.toString()),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Text(args.category.toString()),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: formatIngredients.length - 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              //child: Center(child: Text('Unit ${formatIngredients[index + 1]}')),
                              child: Text('Unit ${formatIngredients[index + 1]}'),
                            );
                          },

                        ),
                      ),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Text(args.preparation.toString()),
                      ),
                    ],
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