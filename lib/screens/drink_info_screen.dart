import 'package:flutter/material.dart';
import 'package:mixdrinks/components/drink_details.dart';
import 'home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// Takes in drink_details class and populates a widget for user viewing
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
    formatIngredients = removeBrackets(args.ingredients.toString()).split(",");
    for (int i = 0; i < formatIngredients.length; i++) {}
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFE5B143),
      ),
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.white,

            // backbutton takes you back to the drink_search page
            appBar: AppBar(
              title: Text(args.name),
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, Home.id);
                },
              ),

              //navigation tabs for different categories
              bottom: TabBar(isScrollable: true, tabs: [
                Tab(text: "Glass"),
                Tab(text: "Category"),
                Tab(text: "Ingredients"),
                Tab(text: "Preparation"),
              ]),
            ),

            // each column corresponds to its respective tab.
            body: TabBarView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      args.glass.toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alef(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "images/" +
                          args.name
                              .toString()
                              .replaceAll(" ", "")
                              .toLowerCase() +
                          ".jpg",
                      width: 300,
                      height: 300,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    child: Text(args.category.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alef(
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Expanded(

                    // builds a formatted list of the ingredients for users to see
                    // in an organized way
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: formatIngredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          padding:
                              EdgeInsets.only(left: 8, right: 8, bottom: 5),
                          //child: Center(child: Text('Unit ${formatIngredients[index + 1]}')),

                          child: Text(
                            (() {
                              List<String> oneIngredient =
                                  formatIngredients[index].split(":");
//                                  print(oneIngredient);
                              if (index != 0 &&
                                  formatIngredients[index].contains("unit")) {
                                return "-----------------" +
                                    "\n" +
                                    "-----------------" +
                                    "\n" +
                                    oneIngredient[0].trim().toUpperCase() +
                                    ": " +
                                    oneIngredient[1].trim();
                              }
                              return oneIngredient[0].trim().toUpperCase() +
                                  ": " +
                                  oneIngredient[1].trim();
                            })(),
                            style: GoogleFonts.alef(
                              fontSize: 20,
                            ),
                          ),
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
                    child: Text(
                      args.preparation.toString(),
                      style: GoogleFonts.alef(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}

// removes all the brackets from the json info from the drink_details class
String removeBrackets(String inStr) {
  return inStr
      .replaceAll("(", "")
      .replaceAll(")", "")
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll("{", "")
      .replaceAll("}", "");
}

// creates a new text widget on a row
Widget getTextWidgets(List<String> strings) {
  return new Row(children: strings.map((item) => new Text(item)).toList());
}
