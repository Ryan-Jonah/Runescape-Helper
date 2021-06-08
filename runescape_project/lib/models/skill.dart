import 'package:flutter/cupertino.dart';

class Skill {
  String rank;
  String level;
  String exp;
  String name;
  String icon;

  List<String> trimmedSkill;

  Skill(String skillString, this.name, imgString) {
    //Separates rank/level/exp
    this.trimmedSkill = skillString.split(',');

    this.rank = trimmedSkill[0];
    this.level = trimmedSkill[1];
    this.exp = trimmedSkill[2];

    this.icon = imgString + ".png";
  }
}
