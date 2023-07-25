// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlib/models/message_model.dart';
import 'package:onlib/providers/chat_provider.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({super.key, required this.message, required this.provider});

  ChatScreenVM provider;
  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: provider.sender.id == message.sender.id
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: /* provider.sender.id */ 1 == message.sender.id
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
        ),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(message.text),
        ),
      ),
    );
  }
}
