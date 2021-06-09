import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'models/skill.dart';

class PlayerStats extends StatefulWidget {
  final String playerName;
  const PlayerStats({Key key, @required this.playerName}) : super(key: key);

  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  //skill and player data
  List<Skill> _skills = <Skill>[];
  String totalLevel = "";

  //obtain player's skill information via Runescape's API, then parse the data
  //and assign it to each individual skill object to contain within a list
  Future<List<Skill>> fetchSkill() async {
    //Set up player name for url parse
    String playerUrl = widget.playerName.replaceAll(" ", "%20");

    //Runescape API call
    var url =
        "https://secure.runescape.com/m=hiscore_oldschool/index_lite.ws?player=${playerUrl}";
    var response = await http.get(Uri.parse(url));

    // container and counter variables
    var skillList = <Skill>[];
    var skillCount = 0;

    //check if connection successful, then separate results
    if (response.statusCode == 200 &&
        response.body.contains("404 - Page not found") == false) {
      var skillResponse = response.body.split('\n');

      //iterate over each skill result and add to skill list; adding name and img
      for (var skill in skillResponse) {
        if (skillCount < 24) {
          switch (skillCount) {
            //Assign skills based on API reponse order
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

          //counter for API reponse body
          skillCount++;
        } else
          break;
      }
    } else if (response.body.contains("404 - Page not found") == true ||
        widget.playerName == null) {
      skillList
          .add(new Skill("404,404,404", "404: Player not found", "404_icon"));
    }

    //return instantiated list of skill objects
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
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(
            'Player Stats for ${widget.playerName}',
            style: TextStyle(color: Colors.grey[50]),
          ),
          centerTitle: true,
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.85,
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: _skills.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                              backgroundColor: Colors.black38,
                              child: Text(
                                """${_skills[index].name.replaceAll("Level", "")}
                                             Level: ${_skills[index].level}
                                             Experience: ${_skills[index].exp}
                                             Rank: #${_skills[index].rank}""",
                                style: TextStyle(
                                    color: Colors.grey[100], fontSize: 24),
                                textAlign: TextAlign.center,
                              ));
                        });

                    debugPrint("Experience: ${_skills[index].exp}");
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                      ]));
            }));
  }
}
