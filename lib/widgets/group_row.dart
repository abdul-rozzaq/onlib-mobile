// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/screens/chat_screen.dart';

import '../models/group_model.dart';

class GroupRow extends StatelessWidget {
  GroupRow({super.key, required this.group});

  Group group;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ChatScreen(group: group,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: greenColor2,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(3),
                color: Colors.white,
                child: Image.asset(
                  "assets/images/lock.png",
                  width: 45,
                  height: 45,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: const TextStyle(fontSize: 20, fontFamily: 'Lobster'),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'data',
                  style: TextStyle(fontSize: 14, fontFamily: 'Lobster'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
