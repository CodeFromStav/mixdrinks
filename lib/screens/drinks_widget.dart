import 'package:flutter/material.dart';
import 'package:mixdrinks/screens/user_ingredients.dart';

class DrinksWidget extends StatelessWidget {
  static const String id = 'drinks_screen';
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
