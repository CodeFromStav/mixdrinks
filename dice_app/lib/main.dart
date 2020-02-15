import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[400],
        appBar: AppBar(
          title: Text('Dice App'),
          backgroundColor: Colors.indigo[400],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceOne = 1;
  int diceTwo = 1;
  int diceThree = 1;
  int diceFour = 1;
  int diceFive = 1;

  void changeDiceFace() {
    setState(() {
      diceOne = Random().nextInt(6) + 1;
      diceTwo = Random().nextInt(6) + 1;
      diceThree = Random().nextInt(6) + 1;
      diceFour = Random().nextInt(6) + 1;
      diceFive = Random().nextInt(6) + 1;
    });
  }

  Expanded buildDice({int diceNumber}) {
    return Expanded(
      child: FlatButton(
        child: Image.asset(
          'images/dice$diceNumber.png',
        ),
        onPressed: () {
          changeDiceFace();
        },
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          buildDice(diceNumber: diceOne),
          buildDice(diceNumber: diceTwo),
          buildDice(diceNumber: diceThree),
          buildDice(diceNumber: diceFour),
          buildDice(diceNumber: diceFive),
        ],
      ),
    );
  }
}
