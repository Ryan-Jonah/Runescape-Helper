import 'package:flutter/material.dart';

class PlayerSearch extends StatefulWidget {
  @override
  _PlayerSearchState createState() => _PlayerSearchState();
}

class _PlayerSearchState extends State<PlayerSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Search'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 10),
            child: TextField(
              scrollPadding: EdgeInsets.all(20),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Search Player"),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                ),
                child: Text(
                  'Sumbit',
                  style: TextStyle(fontSize: 24),
                )),
          ),
          Container(
              height: 400,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      border: Border.all(color: Colors.black87)),
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'data',
                    style: TextStyle(fontSize: 32),
                  )))
        ],
      ),
    );
  }
}
