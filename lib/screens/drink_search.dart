import 'package:flutter/material.dart';
import 'package:mixdrinks/components/search_widget.dart';
import 'dart:convert';
import 'package:mixdrinks/screens/drink_info.dart';
import 'package:mixdrinks/components/drink_details.dart';
import 'package:mixdrinks/screens/drinks_widget.dart';

class DrinkSearch extends StatefulWidget {
  static const String id = 'drink_search';
  @override
  _DrinkSearchState createState() => new _DrinkSearchState();
}

class _DrinkSearchState extends State<DrinkSearch> {

  //Favorite Functionality:
  //This set stores the drinks that the user favorited (set does not allow duplicates)
  final List<String> _suggestions = <String>[];
  final Set<String> _saved = Set<String>();   // Add this line.
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);


  // final formKey = new GlobalKey<FormState>();
  // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Drinks' );

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
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(''), //ADDED STRING PARAM


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

  Widget _buildList( String drink) { //ADDED STRING PARAM
    //allows us to see what drink is already saved

    final alreadySaved = _saved.contains(drink);
//    int index = 1;
//    String saved = _saved.elementAt(index);

    if ((_searchText.isNotEmpty)) {
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
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
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
            setState((){
              if(alreadySaved){
                _saved.remove(drink);
              } else{
                _saved.add(_saved.elementAt(index));
              }
            });
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

  void _getNames() async {
    final drinkData = await DefaultAssetBundle.of(context).loadString('assets/drinks.json');
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

  void _pushSaved(){
//    Navigator.pushNamed(context, SearchWidget.id);
//          final Iterable<ListTile> tiles = _saved.map(
//                (String drink) {
//
//              return ListTile(
//                title: Text('Test'),
//              );
//            },
//          );
//          final List<Widget> divided = ListTile
//              .divideTiles(
//            context: context,
//            tiles: tiles,
//          ).toList();
//
//          return Scaffold(         // Add 6 lines from here...
//            appBar: AppBar(
//              title: Text('Saved Suggestions'),
//            ),
//            body: ListView(children: divided),
//          );                       // ... to here.
////        },
////      ),                       // ... to here.
//    );
  }

}