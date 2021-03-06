import 'package:flutter/material.dart';

import 'package:runescape_project/player_stats.dart';
import 'models/players.dart';
import 'player_search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Runescape Project',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  @override
  _MainNavState createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  //Pages to load
  final List<Widget> _pages = [
    PlayerSearch(),
    PlayerStats(playerName: Players.currentPlayer),
  ];

  //Index to select the current page from _pages
  int _selectedIndex = 0;

  //Function to handle updating the index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //Loads the selected page as the body
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //Styling
        backgroundColor: Colors.black45,
        iconSize: 30.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        //Updates the index when icon is tapped
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        //Navigation Links
        items: [
          //Page 1
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Player Search'),
          //Page 2
          BottomNavigationBarItem(
              icon: Icon(Icons.article), label: 'Player Stats'),
        ],
      ),
    );
  }
}
