import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
          debugPrint("${skillCount} - ${skill}");
          skillList.add(new Skill(skill));
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
                    child: Image.asset("assets/skill_icons/attack_icon.png")),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Rank: ${_skills[index].rank} \nLevel ${_skills[index].level} \nExp: ${_skills[index].exp}",
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ]);
            }));
//       body: GridView.count(
//         primary: false,
//         childAspectRatio: 1.5,
//         padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//         crossAxisSpacing: 5,
//         mainAxisSpacing: 5,
//         crossAxisCount: 3,
//         children: [
//           //----------Title----------
//           Container(
//               child: IconButton(
//                   onPressed: null, icon: Icon(Icons.build_circle_rounded))),
//           Center(
//               child: Text(
//             "Player Name : \n" + player,
//             style: TextStyle(fontSize: 16),
//           )),
//           Container(
//               child: IconButton(
//                   onPressed: null, icon: Icon(Icons.build_circle_rounded))),
//           //----------Row 1----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                   padding: EdgeInsets.all(10),
//                   child: Image.asset("assets/skill_icons/attack_icon.png")),
//               Expanded(
//                 child: Card(
//                   child: Container(
//                       alignment: Alignment.center,
//                       child: Text("Attack - ${_skill[1].level}")),
//                 ),
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/hitpoints_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Hitpoints - ${_skill[4].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/mining_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Mining - ${_skill[15].level}')),
//               ),
//             ],
//           ),
//           //----------Row 2----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/strength_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Strength - ${_skill[3].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/agility_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Agility - ${_skill[17].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/smithing_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Smiting - ${_skill[14].level}')),
//               ),
//             ],
//           ),
//           //----------Row 3----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/defence_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Defence - ${_skill[2].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/herblore_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Herblore - ${_skill[16].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/fishing_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Fishing - ${_skill[11].level}')),
//               ),
//             ],
//           ),
//           //----------Row 4----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/ranged_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Ranged - ${_skill[5].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/thieving_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Thieving - ${_skill[18].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/cooking_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Cooking - ${_skill[8].level}')),
//               ),
//             ],
//           ),
//           //----------Row 5----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/prayer_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Prayer - ${_skill[6].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/crafting_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Crafting - ${_skill[13].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/firemaking_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Firemaking - ${_skill[12].level}')),
//               ),
//             ],
//           ),
//           //----------Row 6----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/magic_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Magic - ${_skill[7].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/fletching_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Fletching - ${_skill[10].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/woodcutting_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Woodcut - ${_skill[9].level}')),
//               ),
//             ],
//           ),
//           //----------Row 7----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                   padding: EdgeInsets.only(left: 5),
//                   child:
//                       Image.asset("assets/skill_icons/runecrafting_icon.png")),
//               Container(child: Text("${_skill[21].level}")),
//               Container(padding: EdgeInsets.all(5), child: Text('RC'))
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Image.asset("assets/skill_icons/slayer_icon.png")),
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Text('Slayer - ${_skill[19].level}'))
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Image.asset("assets/skill_icons/farming_icon.png")),
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Text('Farming - ${_skill[20].level}'))
//             ],
//           ),
//           //----------Row 8----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/construction_icon.png"),
//               Card(
//                 child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(0),
//                     child: Text('Const - ${_skill[23].level}')),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset("assets/skill_icons/hunter_icon.png"),
//               Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.all(0),
//                   child: Text('Hunter - ${_skill[22].level}')),
//             ],
//           ),
//           Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(0),
//             child: Text('Total - ${_skill[0].level}'),
//           ),
//         ],
//       ),
//     );
//   }
// }
  }
}
