import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/skill.dart';

class PlayerStats extends StatefulWidget {
  const PlayerStats({Key key}) : super(key: key);

  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  List<Skill> _skill = <Skill>[];
  String player = "blood%20visage";
  Future<List<Skill>> fetchSkill() async {
    var url =
        "https://secure.runescape.com/m=hiscore_oldschool/index_lite.ws?player=${player}";
    var response = await http.get(Uri.parse(url));

    var skillList = <Skill>[];
    var skillCount = 0;

    if (response.statusCode == 200) {
      var skillResponse = response.body.split(' ');

      for (var skill in skillResponse) {
        if (skillCount < 24) {
          skillList.add(Skill.fromApi(skill));
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
        _skill.addAll(value);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Stats'),
      ),
      body: GridView.count(
        primary: false,
        childAspectRatio: 1.5,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 3,
        children: [
          //----------Title----------
          Container(),
          Center(
              child: Text(
            "Player Name",
            style: TextStyle(fontSize: 16),
          )),
          Container(),
          //----------Row 1----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset("assets/skill_icons/attack_icon.png")),
              Expanded(
                child: Card(
                  child: Container(
                      alignment: Alignment.center, child: Text("Attack")),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/hitpoints_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Hitpoints')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/mining_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Mining')),
              ),
            ],
          ),
          //----------Row 2----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/strength_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Strength')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/agility_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Agility')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/smithing_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Smiting')),
              ),
            ],
          ),
          //----------Row 3----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/defence_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Defence')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/herblore_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Herblore')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/fishing_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Fishing')),
              ),
            ],
          ),
          //----------Row 4----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/ranged_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Ranged')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/thieving_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Thieving')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/cooking_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Cooking')),
              ),
            ],
          ),
          //----------Row 5----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/prayer_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Prayer')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/crafting_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Crafting')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/firemaking_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Firemaking')),
              ),
            ],
          ),
          //----------Row 6----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/magic_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Magic')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/fletching_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Fletching')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/woodcutting_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Woodcutting')),
              ),
            ],
          ),
          //----------Row 7----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 5),
                  child:
                      Image.asset("assets/skill_icons/runecrafting_icon.png")),
              Container(child: Text("Level")),
              Container(padding: EdgeInsets.all(5), child: Text('RC'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/skill_icons/slayer_icon.png")),
              Container(padding: EdgeInsets.all(5), child: Text('Slayer'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/skill_icons/farming_icon.png")),
              Container(padding: EdgeInsets.all(5), child: Text('Farming'))
            ],
          ),
          //----------Row 8----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/construction_icon.png"),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: const Text('Construction')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/skill_icons/hunter_icon.png"),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(0),
                  child: const Text('Hunter')),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            child: const Text('Total'),
          ),
        ],
      ),
    );
  }
}
