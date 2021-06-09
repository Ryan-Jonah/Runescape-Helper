import 'dbhelper.dart';

class Players {
  /*
  global variable for storing the most recently selected player
  used to allow viewing of the stats page via navigation bar
  */
  static String currentPlayer = "%None%";

  int playerId;

  Players(this.playerId);

  Players.fromMap(Map<String, dynamic> map) {
    playerId = map['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.colId: playerId,
    };
  }
}
