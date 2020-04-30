import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'drinks_widget.dart';
import 'package:mixdrinks/screens/drinks_widget.dart';

///Class is responsible for the handling of user's selected ingredients
class UserIngredients extends StatefulWidget {

  ///Class variables
  static String id = "user_ingredients";
  UserIngredients({Key key, this.title}) : super(key: key);
  static List<String> ingredients = _UserIngredientsState.myIngredients;
  final String title;

  ///Create the state of the widget
  @override
  _UserIngredientsState createState() => _UserIngredientsState();
}

class _UserIngredientsState extends State<UserIngredients> {
  ///Class variables
  Set ingredients;
  static List<String> myIngredients = new List();

  /// List for drink ingredients
  static List<String> drinkIngredients = [
    "Gin",
    "Vodka",
    "Lillet Blonde",
    "White Rum",
    "Lime juice",
    "Syrup",
    "Campari",
    "Vermouth",
    "Kirsch",
    "Strawberry Syrup",
    "Whiskey",
    "Angostura Bitters",
    "Sugar Cube",
    "Plain Water",
    "Maraschino",
    "Absinthe",
    "Orange Bitters",
    "Mint Sprigs",
    "White Sugar",
    "Soda Water",
    "Cognac",
    "Ginger Ale",
    "Dark Rum",
    "Orange juice",
    "Pineapple juice",
    "Lemon juice",
    "Cranberry juice",
    "Grapefruit juice",
    "Pisco",
    "Egg",
    "Tequila",
    "Triple Sec",
    "Cola",
    "Apricot Brandy",
    "Calvados",
    "Champagne",
    "Red Port",
    "Coffee liqueur",
    "Espresso",
    "Galliano",
    "Coconut milk",
    "Cherry liqueur",
    "Prosecco",
    "Peach puree",
    "Créme liqueur",
    "Cream",
    "Drambuie",
    "Cream liqueur",
    "DiSaronno",
    "Aperol",
    "Blackberry liqueur",
    "Raspberry liqueur",
    "Tomato juice",
    "Worcestershire Sauce",
    "Tabasco",
    "Celery salt",
    "Pepper",
    "Peach schnapps",
    "Grenadine",
    "Peach Bitters",
    "Mint leaves",
    "Hot coffee",
    "Brown sugar",
    "Peychaud's Bitters"
  ];

  //Labels for the handling of selected ingredients
  static bool ginVal = false;
  static bool vodkaVal = false;
  static bool lilletBlondeVal = false;
  static bool whiteRumVal = false;
  static bool limejuiceVal = false;
  static bool syrupVal = false;
  static bool campariVal = false;
  static bool vermouthVal = false;
  static bool kirschVal = false;
  static bool strawberrySyrupVal = false;
  static bool whiskeyVal = false;
  static bool angosturaBittersVal = false;
  static bool sugarCubeVal = false;
  static bool plainWaterVal = false;
  static bool maraschinoVal = false;
  static bool absintheVal = false;
  static bool orangeBittersVal = false;
  static bool mintSprigsVal = false;
  static bool whiteSugarVal = false;
  static bool sodaWaterVal = false;
  static bool cognacVal = false;
  static bool gingerAleVal = false;
  static bool darkRumVal = false;
  static bool orangeJuiceVal = false;
  static bool pineappleJuiceVal = false;
  static bool lemonJuiceVal = false;
  static bool cranberryJuiceVal = false;
  static bool grapefruitJuiceVal = false;
  static bool piscoVal = false;
  static bool eggVal = false;
  static bool tequilaVal = false;
  static bool tripleSecVal = false;
  static bool colaVal = false;
  static bool apricotBrandyVal = false;
  static bool calvadosVal = false;
  static bool champagneVal = false;
  static bool redPortVal = false;
  static bool coffeeLiqueurVal = false;
  static bool espresso = false;
  static bool gallianoVal = false;
  static bool coconutMilkVal = false;
  static bool cherryLiqueurVal = false;
  static bool proseccoVal = false;
  static bool peachPureeVal = false;
  static bool cremeLiqueurVal = false;
  static bool creamVal = false;
  static bool drambuieVal = false;
  static bool creamLiqueurVal = false;
  static bool diSaronnoVal = false;
  static bool aperolVal = false;
  static bool blackberryLiqueurVal = false;
  static bool raspberryLiqueurVal = false;
  static bool tomatoJuiceVal = false;
  static bool worcestershireSauceVal = false;
  static bool tabascoVal = false;
  static bool celerySaltVal = false;
  static bool pepperVal = false;
  static bool peachSchnappsVal = false;
  static bool grenadineVal = false;
  static bool peachBittersVal = false;
  static bool mintLeavesVal = false;
  static bool hotCoffeeVal = false;
  static bool brownSugarVal = false;
  static bool peychaudBittersVal = false;

  //List of all the label values
  List<bool> values = [
    ginVal,
    vodkaVal,
    lilletBlondeVal,
    whiteRumVal,
    limejuiceVal,
    syrupVal,
    campariVal,
    vermouthVal,
    kirschVal,
    strawberrySyrupVal,
    whiskeyVal,
    angosturaBittersVal,
    sugarCubeVal,
    plainWaterVal,
    maraschinoVal,
    absintheVal,
    orangeBittersVal,
    mintSprigsVal,
    whiteSugarVal,
    sodaWaterVal,
    cognacVal,
    gingerAleVal,
    darkRumVal,
    orangeJuiceVal,
    pineappleJuiceVal,
    lemonJuiceVal,
    cranberryJuiceVal,
    grapefruitJuiceVal,
    piscoVal,
    eggVal,
    tequilaVal,
    tripleSecVal,
    colaVal,
    apricotBrandyVal,
    calvadosVal,
    champagneVal,
    redPortVal,
    coffeeLiqueurVal,
    espresso,
    gallianoVal,
    coconutMilkVal,
    cherryLiqueurVal,
    proseccoVal,
    peachPureeVal,
    cremeLiqueurVal,
    creamVal,
    drambuieVal,
    creamLiqueurVal,
    diSaronnoVal,
    aperolVal,
    blackberryLiqueurVal,
    raspberryLiqueurVal,
    tomatoJuiceVal,
    worcestershireSauceVal,
    tabascoVal,
    celerySaltVal,
    pepperVal,
    peachSchnappsVal,
    grenadineVal,
    peachBittersVal,
    mintLeavesVal,
    hotCoffeeVal,
    brownSugarVal,
    peychaudBittersVal
  ];

  ///Custom widget for the functionality of a simple checkbox with a label
  Widget checkbox(String text, bool value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: value,
          onChanged: (bool newVal) {
            setState(() {
              addIngredient(text);
              print(myIngredients);
            });
          },
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    checkBoxes();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ingredients"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DrinksWidget.id, arguments: myIngredients); // Move to Drinks Page
        },
      ),
      body: ListView.builder(
        itemCount: drinkIngredients.length,
        itemBuilder: (context, index) {
          return checkbox(drinkIngredients[index], values[index]);
        },
      ),
    );
  }

  void checkBoxes() {
    for (int index = 0; index < myIngredients.length; index++) {
      int element = drinkIngredients.indexOf(myIngredients[index]);
      if ( element > 0) {
        values[element] = true;
      }
    }
  }

  void addIngredient(String ingredient) {
    for (int i = 0; i < drinkIngredients.length; i++) {
      if (ingredient == drinkIngredients[i]) {
        values[i] = !values[i];
        String temp = drinkIngredients[i].replaceAll(" ", "").toLowerCase();
        if (!myIngredients.contains(temp)) {
          myIngredients.add(temp);
        } else {
          myIngredients.remove(temp);
        }
      }
    }
  }
}
