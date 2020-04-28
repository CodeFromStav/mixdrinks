import 'package:flutter/material.dart';
import 'package:mixdrinks/components/search_widget.dart';
import 'dart:convert';
import 'package:mixdrinks/screens/drink_info.dart';
import 'package:mixdrinks/components/drink_details.dart';
import 'package:mixdrinks/screens/drinks_widget.dart';

class DrinksWidget extends StatefulWidget {
  static const String id = 'drinks_screen';

  @override
  _DrinksWidgetState createState() => new _DrinksWidgetState();

}
class _DrinksWidgetState extends State<DrinksWidget> {


//  final String itemHolder;
//  DrinksWidget({Key key, @required this.itemHolder}) : super(key: key);

  goBack(BuildContext context){
    Navigator.pop(context);
  }

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(12));

  // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
  // The List.generate() constructor allows an easy way to create
  // a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) => List.generate(
      count, (i) => Container(child: Image.asset('images/images$i.jpg')));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF3CC79),
    ),

      child: Center(

        child: _buildGrid()
      )
    );
  }
}
