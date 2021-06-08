import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'models/skill.dart';

class PlayerStats extends StatefulWidget {
  const PlayerStats({Key key}) : super(key: key);

  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  // ---Skill Order---
  // [0-10]  Overall, Attack, Defence, Strength, Hitpoints, Ranged, Prayer, Magic, Cooking, Woodcutting,
  // [11-20] Fletching, Fishing, Firemaking, Crafting, Smithing, Mining, Herblore, Agility, Thieving, Slayer,
  // [21-24] Farming, Runecrafting, Hunter, Construction.
  List<Skill> _skills = <Skill>[];
  String player = "blood%20visage";
  Future<List<Skill>> fetchSkill() async {
    var url =
        "https://secure.runescape.com/m=hiscore_oldschool/index_lite.ws?player=blood%20visage";
    var response = await http.get(Uri.parse(url));

    var skillList = <Skill>[];
    var skillCount = 0;

    if (response.statusCode == 200) {
      var skillResponse = response.body.split('\n');

      for (var skill in skillResponse) {
        if (skillCount < 24) {
          //Assign skills based on API reponse order
          switch (skillCount) {
            case 0:
              skillList.add(new Skill(skill, "Total Level", "total_icon"));
              break;
            case 1:
              skillList.add(new Skill(skill, "Attack Level", "attack_icon"));
              break;
            case 2:
              skillList.add(new Skill(skill, "Defence Level", "defence_icon"));
              break;
            case 3:
              skillList
                  .add(new Skill(skill, "Strength Level", "strength_icon"));
              break;
            case 4:
              skillList
                  .add(new Skill(skill, "Hitpoints Level", "hitpoints_icon"));
              break;
            case 5:
              skillList.add(new Skill(skill, "Ranged Level", "ranged_icon"));
              break;
            case 6:
              skillList.add(new Skill(skill, "Prayer Level", "prayer_icon"));
              break;
            case 7:
              skillList.add(new Skill(skill, "Magic Level", "magic_icon"));
              break;
            case 8:
              skillList.add(new Skill(skill, "Cooking Level", "cooking_icon"));
              break;
            case 9:
              skillList.add(
                  new Skill(skill, "Woodcutting Level", "woodcutting_icon"));
              break;
            case 10:
              skillList
                  .add(new Skill(skill, "Fletching Level", "fletching_icon"));
              break;
            case 11:
              skillList.add(new Skill(skill, "Fishing Level", "fishing_icon"));
              break;
            case 12:
              skillList
                  .add(new Skill(skill, "Firemaking Level", "firemaking_icon"));
              break;
            case 13:
              skillList
                  .add(new Skill(skill, "Crafting Level", "crafting_icon"));
              break;
            case 14:
              skillList
                  .add(new Skill(skill, "Smithing Level", "smithing_icon"));
              break;
            case 15:
              skillList.add(new Skill(skill, "Mining Level", "mining_icon"));
              break;
            case 16:
              skillList
                  .add(new Skill(skill, "Herblore Level", "herblore_icon"));
              break;
            case 17:
              skillList.add(new Skill(skill, "Agility Level", "agility_icon"));
              break;
            case 18:
              skillList
                  .add(new Skill(skill, "Thieving Level", "thieving_icon"));
              break;
            case 19:
              skillList.add(new Skill(skill, "Slayer Level", "slayer_icon"));
              break;
            case 20:
              skillList.add(new Skill(skill, "Farming Level", "farming_icon"));
              break;
            case 21:
              skillList.add(
                  new Skill(skill, "Runecrafting Level", "runecrafting_icon"));
              break;
            case 22:
              skillList.add(new Skill(skill, "Hunter Level", "hunter_icon"));
              break;
            case 23:
              skillList.add(
                  new Skill(skill, "Construction Level", "construction_icon"));
              break;
          }

          debugPrint("""\nSuccessfully loaded: ${skillList[skillCount].name} 
              Rank: ${skillList[skillCount].rank} / 
              Level: ${skillList[skillCount].level} / 
              Exp: ${skillList[skillCount].exp} / 
              Icon: ${skillList[skillCount].icon} """);

          skillCount++;
        } else
          break;
      }
    }
    return skillList;
  }

  @override
  void initState() {
    fetchSkill().then((value) {
      setState(() {
        _skills.addAll(value);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Player Stats',
          ),
          centerTitle: true,
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: _skills.length,
            itemBuilder: (context, index) {
              return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                        "assets/skill_icons/${_skills[index].icon}")),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    _skills[index].level,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 24),
                  ),
                ))
              ]);
            }));
  }
}
