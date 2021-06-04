import 'package:flutter/material.dart';

class PlayerStats extends StatefulWidget {
  const PlayerStats({Key key}) : super(key: key);

  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Search'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: Text(
              'Player Name',
              style: TextStyle(fontSize: 36),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.black87)),
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: Text('data')))
        ],
      ),
    );
  }
}
