import 'package:flutter/material.dart';
import 'models/dbhelper.dart';

import 'player_stats.dart';
import 'models/players.dart';

class PlayerSearch extends StatefulWidget {
  @override
  _PlayerSearchState createState() => _PlayerSearchState();
}

class _PlayerSearchState extends State<PlayerSearch> {
  final TextEditingController _playerName = TextEditingController();

  final dbHelper = DBHelper.instance;

  //Store history of searched players
  List<String> players = [];

  void _insert() async {
    Map<String, dynamic> row = {
      DBHelper.colName: Players.currentPlayer,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id is: $id');
  }

  //Reload database items into the players list to display
  void _updatePlayerList() async {
    final allRows = await dbHelper.queryAllRows();
    for (final r in allRows) {
      players.add(r["name"].toString());
    }
    setState(() {});
  }

  @override
  void initState() {
    _updatePlayerList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          'Player Search',
          style: TextStyle(color: Colors.grey[50]),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Player Search box
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 10),
            child: TextField(
              scrollPadding: EdgeInsets.all(20),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Search Player"),
              controller: _playerName,
            ),
          ),
          //Player Search button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: ElevatedButton(
                onPressed: () {
                  //Set the current player and open the stat page
                  Players.currentPlayer = _playerName.text;
                  _insert();
                  _updatePlayerList();
                  setState(() {
                    //Add searched player name to first of the list
                    players.insert(0, Players.currentPlayer);
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayerStats(
                              playerName: players[players
                                  .lastIndexOf(Players.currentPlayer)])));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey[800]),
                ),
                child: Text(
                  'Sumbit',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )),
          ),
          //Pleyer search history
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FittedBox(
                child: Text(
              "Searched Players",
              style: TextStyle(fontSize: 36),
            )),
          ),
          //Create a button for each player linking to the stats page
          Container(
              child: Expanded(
                  child: ListView.builder(
                      itemCount: players.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: ElevatedButton(
                                child: Text(
                                  players[index],
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(20)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () {
                                  Players.currentPlayer = players[index];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlayerStats(
                                              playerName: players[index])));
                                }));
                      })))
        ],
      ),
    );
  }
}
