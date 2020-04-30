import 'dart:core';
import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/user_ingredients_screen.dart' as ingredients;
import 'dart:convert';
import 'package:mixdrinks/screens/drink_info_screen.dart';
import 'package:mixdrinks/components/drink_details.dart';

///Class is responsible for handling the user generated drinks page
class DrinksWidget extends StatelessWidget {
  ///Class Variables
  static const String id = 'drinks_screen';
  static List<String> myIngredients = ingredients.UserIngredients.ingredients; // stores the dynamic list of user selected ingredients
  static List drinkArchive;
  static List<bool> drinkStatus = new List();
  static List<String> drinks = [
    "Vesper",
    "Bacardi",
    "Negroni",
    "Rose",
    "Old Fashioned",
    "Tuxedo",
    "Mojito",
    "Horse's Neck",
    "Planter's Punch",
    "Sea Breeze",
    "Pisco Sour",
    "Long Island Iced Tea",
    "Clover Club",
    "Angel Face",
    "Mimosa",
    "Whiskey Sour",
    "Screwdriver",
    "Cuba Libre",
    "Manhattan",
    "Porto Flip",
    "Gin Fizz",
    "Espresso Martini",
    "Margarita",
    "French 75",
    "Yellow Bird",
    "Pina Colada",
    "Aviation",
    "Bellini",
    "Grasshopper",
    "Tequila Sunrise",
    "Daiquiri",
    "Rusty Nail",
    "B52",
    "Stinger",
    "Golden Dream",
    "God Mother",
    "Spritz Veneziano",
    "Bramble",
    "Alexander",
    "Lemon Drop Martini",
    "French Martini",
    "Black Russian",
    "Bloody Mary",
    "Mai-tai",
    "Barracuda",
    "Sex on the Beach",
    "Monkey Gland",
    "Derby",
    "Sidecar",
    "Irish Coffee",
    "Sazerac",
    "Americano",
    "Singapore Sling",
    "French Connection",
    "Moscow Mule",
    "John Collins",
    "Kir",
    "Mint Julep",
    "Tommy's Margarita",
    "Paradise",
    "Dirty Martini",
    "Champagne Cocktail",
    "Mary Pickford",
    "Hemingway Special",
    "Dark 'n' Stormy",
    "Ramos Fizz",
    "Russian Spring Punch",
    "God Father",
    "Cosmopolitan",
    "Dry Martini",
    "Between the Sheets",
    "Casino",
    "Caipirinha",
    "Vampiro",
    "Kamikaze",
    "White Lady",
    "Harvey Wallbanger"
  ];

  final List<String> renderList = new List();

  Widget _buildGrid(BuildContext context) => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(renderList.length ?? 0, context));

  ///Generates each drink that can be brewed
  List<Container> _buildGridTileList(int count, BuildContext context) => List.generate(
        count,
        (i) => Container(
            child: FlatButton(
                onPressed: () {
                  generateDrinkInfo(renderList[i], context);
                },
                child: Image.asset(
                    'images/${renderList[i].replaceAll(" ", "").toLowerCase()}.jpg'))),
      );

  @override
  Widget build(BuildContext context) {
    getIngredients(context);
    getStatus();
    renderListFunction();
    if (renderList.length > 0) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Drinks Brewed"),
          ),
          body: Center(
            child: _buildGrid(context),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Brewing Failed"),
        ),
        body: Center(
          child: Text("No drinks can be made from the selected ingredients."),
        ),
      );
    }
  }

  ///Method for getting the ingredients from the json file
  getIngredients(BuildContext context) async {
    final drinkData =
        await DefaultAssetBundle.of(context).loadString('assets/drinks.json');
    List jsonList = jsonDecode(drinkData);
    drinkArchive = new List();
    for (int i = 0; i < jsonList.length; i++) {
      drinkArchive.add(jsonList[i]);
    }
  }

  ///Method to get the brewing status of all drinks
  void getStatus() {
    drinkStatus = new List();
    if (drinkArchive != null) {
      for (int i = 0; i < drinkArchive.length; i++) {
        //print("Drink: " + drinkArchive[i]['name']);

        drinkStatus.add(canMake(drinkArchive[i]['ingredients']));
        //print(canMake(tempList[i]['ingredients']));
      }
    }
  }

  ///Method for determining if a drink can be made with the given ingredients
  bool canMake(List<dynamic> drink) {
    for (int i = 0; i < drink.length; i++) {
      String ingredient = drink[i]['ingredient'];
      if (!hasIngredient(ingredient)&&ingredient != null) {
        return false;
      }
    }
    return true;
  }

  ///Method responsible for generating the render list of brewable drinks
  void renderListFunction() {
    if (drinkStatus.length == drinks.length) {
      for (int index = 0; index < drinks.length; index++) {
        String simpleDrink = drinks[index].replaceAll(" ", "").toLowerCase(); //Standardize data string
        bool status = drinkStatus[index]; // status of current drink
        if (status) {
          if (!renderList.contains(simpleDrink)) {
            renderList.add(simpleDrink);
            //print(simpleDrink + " added to the drinks page");
          }
        }
        else {
          if (renderList.contains(simpleDrink)) {
            renderList.remove(simpleDrink);
            //print(simpleDrink + " removed from the drinks page");
          }
        }
      }
    }
  }

  ///Helper method for determining if an ingredient is present or not
  bool hasIngredient(String ingredient) {
    if (ingredient != null) {
      String temp = ingredient.replaceAll(" ", "").toLowerCase(); //Standardize data string
      return myIngredients.contains(temp);
    }
    //No ingredient found
    return false;
  }

  ///Method responsible for transitioning the user to the selected drink's information page
  void generateDrinkInfo(String name, BuildContext context) {
    for (int i = 0; i < drinkArchive.length; i++) {
      String temp = drinkArchive[i]['name'].replaceAll(" ", "").toLowerCase(); //standardize data string
      if (temp == name) {
        //print(drinkArchive[i]['name']); //prints the name of the selected drink
        //Move to drink info page for selected drink
        Navigator.pushNamed(
          context,
          DrinkInfo.id,
          arguments: DrinkDetails(
            drinkArchive[i]["name"],
            drinkArchive[i]["glass"],
            drinkArchive[i]["category"],
            drinkArchive[i]["ingredients"],
            drinkArchive[i]["preparation"],
          ),
        );
      }
    }
  }
}
