// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

import 'package:onlib/models/user_model.dart';

List<Message> messagesFromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

class Message {
    String id;
    User sender;
    DateTime created;
    DateTime updated;
    String text;
    String group;

    Message({
        required this.id,
        required this.sender,
        required this.created,
        required this.updated,
        required this.text,
        required this.group,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        sender: User.fromJson(json["sender"]),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        text: json["text"],
        group: json["group"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sender": sender.toJson(),
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "text": text,
        "group": group,
    };
}

