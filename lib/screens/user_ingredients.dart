import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class UserIngredients extends StatefulWidget {
  UserIngredients({Key key, this.title}) : super(key: key);
  final String title;
  static List<String> ingredients = _UserIngredientsState.myIngredients;

  @override
  _UserIngredientsState createState() => _UserIngredientsState();
}

class _UserIngredientsState extends State<UserIngredients> {
  Set ingredients;
  static List<String> myIngredients = new List();
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
  List<String> getIngredients(){
    return myIngredients;
  }

  Widget checkbox(String text, bool value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: value,
          onChanged: (bool newVal) {
            setState(() {
            for(int i = 0; i < drinkIngredients.length; i++) {
              if ( text == drinkIngredients[i]) {
                values[i] = !values[i];
                if ( !myIngredients.contains(drinkIngredients[i])) {
                      myIngredients.add(drinkIngredients[i]);
                }
                else {
                  myIngredients.remove(drinkIngredients[i]);
                }
              }
            }
            //print(myIngredients);
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
      body: ListView.builder(
        itemCount: drinkIngredients.length,
        itemBuilder: (context, index) {
          return checkbox(drinkIngredients[index], values[index]);
        },
      ),
    );
  }

  void checkBoxes() {
    for (int index = 0; index < myIngredients.length; index++ ) {
      int element = drinkIngredients.indexOf(myIngredients[index]);
      values[element] = true;
    }
  }


}

