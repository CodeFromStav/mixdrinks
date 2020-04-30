import 'dart:core';
import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/user_ingredients.dart' as ingredients;
import 'dart:convert';

class DrinksWidget extends StatelessWidget {
  static const String id = 'drinks_screen';
  static List<String> myIngredients = ingredients.UserIngredients.ingredients;
  static List tempList;
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

  List<String> renderList = new List();

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(renderList.length ?? 0));

  // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
  // The List.generate() constructor allows an easy way to create
  // a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
          child: Image.asset(
              'images/${renderList[i].replaceAll(" ", "").toLowerCase()}.jpg')));

  @override
  Widget build(BuildContext context) {
    getIngredients(context);
    isBreweable();
    renderListFunction();
    if (renderList.length > 0) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Drinks Brewed"),
          ),
          body: Center(
            child: _buildGrid(),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Drinks Brewed"),
          ),
          body: Center(
            child: Text("No drinks can be made from the selected ingredients."),
          ));
    }
  }

  getIngredients(BuildContext context) async {
    final drinkData =
        await DefaultAssetBundle.of(context).loadString('assets/drinks.json');
    List jsonList = jsonDecode(drinkData);
    tempList = new List();
    for (int i = 0; i < jsonList.length; i++) {
      tempList.add(jsonList[i]);
    }
  }

  void isBreweable() {
    drinkStatus = new List();
    if (tempList != null) {
      for (int i = 0; i < tempList.length; i++) {
        //print("Drink: " + tempList[i]['name']);

        drinkStatus.add(canMake(tempList[i]['ingredients']));
        //print(canMake(tempList[i]['ingredients']));
      }
    }
  }

  bool canMake(List<dynamic> drink) {
    for (int i = 0; i < drink.length; i++) {
      String ingredient = drink[i]['ingredient'];
      if (!isBrewable(ingredient)) {
        return false;
      }
    }
    return true;
  }

  void renderListFunction() {
    if (drinkStatus.length == drinks.length) {
      for (int i = 0; i < drinks.length; i++) {
        String simpleDrink = drinks[i].replaceAll(" ", "").toLowerCase();
        if (drinkStatus[i]) {
          if (!renderList.contains(simpleDrink)) {
            renderList.add(simpleDrink);
            //print(simpleDrink + " added to the drinks page");
          }
        } else {
          if (renderList.contains(simpleDrink)) {
            renderList.remove(simpleDrink);
            //print(simpleDrink + " removed from the drinks page");
          }
        }
      }
    }

    //print(renderList.length);
  }

  bool isBrewable(String ingredient) {
    if (ingredient != null) {
      String temp = ingredient.replaceAll(" ", "").toLowerCase();
      return myIngredients.contains(temp);
    }
    return false;
  }
}
