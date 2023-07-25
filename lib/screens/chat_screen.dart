// ignore_for_file: unused_local_variable, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/providers/chat_provider.dart';
import 'package:onlib/services/prefs.dart';
import 'package:onlib/widgets/message.dart';
import 'package:provider/provider.dart';

import '../models/group_model.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.group});

  Group group;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<ChatScreenVM>(context, listen: false);

    provider.setSender();
    provider.initChannel(widget.group.id);
    provider.getMessages(widget.group.id);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatScreenVM>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
        backgroundColor: greenColor,
      ),
      body: provider.isMessagesLoading
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => MessageWidget(
                        message: provider.messages[index], provider: provider),
                    itemCount: provider.messages.length,
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: provider.inputController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Type your message here...',
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: provider.sendMessage,
                          icon: const Icon(Icons.send))
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                color: greenColor,
              ),
            ),
    );
  }
}
