import 'dart:convert';

import 'package:onlib/models/user_model.dart';

List<Group> groupsFromJson(String str) => List<Group>.from(json.decode(str).map((x) => Group.fromJson(x)));

class Group {
    String id;
    User owner;
    List<User> members;
    DateTime created;
    DateTime updated;
    String name;

    Group({
        required this.id,
        required this.owner,
        required this.members,
        required this.created,
        required this.updated,
        required this.name,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        owner: User.fromJson(json["owner"]),
        members: List<User>.from(json["members"].map((x) => User.fromJson(x))),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner.toJson(),
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "name": name,
    };
}
