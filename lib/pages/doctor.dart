import 'package:flutter/material.dart';

import './doctorlist.dart';

// class DoctorPage extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Search',
//       //debugShowCheckedModeBanner: false,
//       theme: new ThemeData(
//         //brightness: Brightness.light,
//         primarySwatch:Colors.yellow,
//         primaryColor: Color(0xFFFFBB54),
//         accentColor: Color(0xFFECEFF1),
//       ),
//       home: new SearchList(),
//     );
//   }
// }

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => new _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = new Text('Live Doctor',
      style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.bold));
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.blue,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _isSearching;
  String _searchText = "";

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    init();
  }

  void init() {
    _list = List();
    _list.add("Allergology");
    _list.add("Anesthesiology");
    _list.add("Cardiology");
    _list.add("Dermatology");
    _list.add("Gastroenterology");
    _list.add("Internal Medicine");
    _list.add("Obstetrics & Gynecology");
    _list.add("Orthopedics");
    _list.add("Pathology");
    _list.add("Pediatrics");
    _list.add("Psychiatry");
    _list.add("Radiology");
    _list.add("Surgery");
    _list.add("Research");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _isSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact)).toList();
    } else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0.0,
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(
                    Icons.close,
                    color: Colors.blue,
                  );
                  this.appBarTitle = new TextField(
                    controller: _searchQuery,
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.blue),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.grey)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.blue,
      );
      this.appBarTitle = new Text('Live Doctor',
          style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold));
      _isSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: Icon(Icons.more_vert),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) => DoctorListPage()));
          },
        title: new Text(this.name,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold)));
  }
}
