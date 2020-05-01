import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mixdrinks/screens/drink_info_screen.dart';
import 'package:mixdrinks/components/drink_details.dart';

class DrinkSearch extends StatefulWidget {
  static const String id = 'drink_search';

  @override
  _DrinkSearchState createState() => new _DrinkSearchState();
}

class _DrinkSearchState extends State<DrinkSearch> {
  //Favorite Functionality:
  //This set stores the drinks that the user favorited (set does not allow duplicates)
  final Set<String> _saved = Set<String>(); // Add this line.
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Drinks');

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

  //build function is called multiple times throughout program to set the build the display
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(), //ADDED STRING PARAM
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  //Created a widget that includes the search bar at the top
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
      actions: <Widget>[
        // Add 3 lines from here...
        new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
      ], // ... to here.
    );
  }

  //builds a list of drinks based on the JSON file we read from
  Widget _buildList() {
    if ((_searchText.isNotEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    //this returns the ListView and carries out onTap actions
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        //allows us to see what drink is already saved
        final alreadySaved = _saved.contains(filteredNames[index].toString());

        return Column(
            children: [

          Container(
            //this ListTile contains the name of the drink as well as a heart icon trailing that turns red when activated
            child: ListTile(
              title: Text(filteredNames[index]['name']),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
              ),
              //when a specific tile is pressed, it will take you to a page containing the following sections. It will also update the drink to pressed,
              //and add that drink selected to favorites for now.
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
              onLongPress: (){
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(filteredNames[index].toString());
                    print("Drink " +
                        filteredNames[index].toString() +
                        "REMOVED!");
                    print("\n  ==================== \n");
                    print(_saved);
                  } else {
                    _saved.add(filteredNames[index].toString());
                    print(
                        "Drink " + filteredNames[index].toString() + "ADDED!");
                    print("\n  ==================== \n");
                  }
                  print(_saved);
                });
              },
            ),
          ),
        ]);
      },
    );
  }

//this method carries out the search bar functionality
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  //this method extracts the names from the JSON file and puts them in a list, shuffles the list, then sets a name.
  void _getNames() async {
    final drinkData =
        await DefaultAssetBundle.of(context).loadString('assets/drinks.json');
    List jsonList = jsonDecode(drinkData);
    List tempList = new List();
    for (int i = 0; i < jsonList.length; i++) {
      tempList.add(jsonList[i]);
    }
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }

  //this method creates a new page that is populated with listTiles that were selected and therefore favorited (for now).
  //this puts the specified favorited drink in a divided tile.
  void _pushSaved() {
    Navigator.of(context).push<Set>(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String filteredNames) {
              return new ListTile(
                title: new Text(
                  filteredNames.toString(),
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new WillPopScope(
            onWillPop: () async => false,

            child:Scaffold(
            appBar: new AppBar(
              title: const Text('Favorited Drinks'),
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: new ListView(children: divided),
          ),
          );
        },
      ),
    );
  }
}
