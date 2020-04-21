import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget();

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(index
              .toString()), // TODO: Complete search for drinks/ingredients
        );
      },
      drawer: Drawer(
        child:
        Container(), // TODO: ADD OPTIONS
      ),
      onChanged: (String value) {},
      onTap: () {},
      decoration: InputDecoration.collapsed(
        hintText: "Search...",
      ),
    );
  }
}