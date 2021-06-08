import 'package:flutter/cupertino.dart';

class Skill {
  String rank;
  String level;
  String exp;
  List<String> trimmedSkill;

  Skill(skill) {
    this.trimmedSkill = skill.split(',');

    this.rank = trimmedSkill[0];
    this.level = trimmedSkill[1];
    this.exp = trimmedSkill[2];
    debugPrint(
        "______________________________________-Rank: ${trimmedSkill[0]} / Level: ${trimmedSkill[1]} / Exp: ${trimmedSkill[2]}");
  }
}
