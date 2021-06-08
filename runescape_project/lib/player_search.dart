import 'package:flutter/material.dart';

class PlayerSearch extends StatefulWidget {
  @override
  _PlayerSearchState createState() => _PlayerSearchState();
}

class _PlayerSearchState extends State<PlayerSearch> {
  @override
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
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey[800]),
                ),
                child: Text(
                  'Sumbit',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FittedBox(
                child: Text(
              "Saved searched",
              style: TextStyle(fontSize: 36),
            )),
          ),
          Container(
              child: Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: ElevatedButton(
                                child: Text("Player ${index}"),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(20)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () {}));
                      })))
        ],
      ),
    );
  }
}
