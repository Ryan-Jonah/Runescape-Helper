class Skill {
  int rank;
  int level;
  int exp;

  Skill({this.rank, this.level, this.exp});

  Skill.fromApi(String skill) {
    List<String> trimmedSkill = skill.split(',');

    level = int.parse(trimmedSkill[0]);
    rank = int.parse(trimmedSkill[1]);
    exp = int.parse(trimmedSkill[2]);
  }
}
