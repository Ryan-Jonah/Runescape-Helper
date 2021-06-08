import 'package:flutter/cupertino.dart';

class Skill {
  String rank;
  String level;
  String exp;

  Skill({this.rank, this.level, this.exp});

  Skill.fromApi(String skill) {
    List<String> trimmedSkill = skill.split(',');

    rank = trimmedSkill[0];
    level = trimmedSkill[1];
    exp = trimmedSkill[2];
    debugPrint(
        "______________________________________-Rank: ${trimmedSkill[0]} / Level: ${trimmedSkill[1]} / Exp: ${trimmedSkill[2]}");
  }
}
