import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text('I Like to Run'),
          backgroundColor: Colors.lightGreen[600],
        ),
        body: Center(
          child: Image(image: AssetImage('images/run_pic.png')),
        ),
      ),
    ),
  );
}