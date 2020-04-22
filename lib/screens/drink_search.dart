import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mixdrinks/screens/drink_info.dart';
import 'package:mixdrinks/components/drink_details.dart';

class DrinkSearch extends StatefulWidget {
  static const String id = 'drink_search';
  static String data = jsonDecode (_DrinkSearchState.drinkData);
  @override
  _DrinkSearchState createState() => new _DrinkSearchState();
}

class _DrinkSearchState extends State<DrinkSearch> {
  // final formKey = new GlobalKey<FormState>();
  // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Drinks' );
  static String drinkData;
  _DrinkSearchState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this.getNames();
    super.initState();
  }

  String getData () {
    return drinkData;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,

      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () {
            Navigator.pushNamed(
              context,
              DrinkInfo.id,
              arguments: DrinkDetails(
                filteredNames[index]["name"],
                filteredNames[index]["glass"],
                filteredNames[index]["category"],
                filteredNames[index]["ingredients"],
                filteredNames[index]["preparation"],
              ),
            );
          },
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Example' );
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void getNames() async {
    drinkData = await DefaultAssetBundle.of(context).loadString('assets/drinks.json');
    List jsonList = jsonDecode(drinkData);
    //print(jsonList);
    List tempList = new List();
    for (int i = 0; i < jsonList.length; i++) {
      //print(jsonList[i]); // 2 drinks at a time
      tempList.add(jsonList[i]);
    }
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }


}