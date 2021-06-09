import 'dart:convert';

class Players {
  final String name;

  Players(this.name);

  Players.fromJson(Map<String, dynamic> json) : name = json["name"];

  Map<String, dynamic> toJson() => {'name': name};
}
