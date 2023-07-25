// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/widgets/group_row.dart';
import '../providers/homepage_provider.dart';

class ChatTab extends StatefulWidget {
  ChatTab({super.key, required this.provider});

  HomePageVM provider;

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: greenColor,
      onRefresh: _refresh,
      child: ListView.builder(
        itemBuilder: (context, index) => GroupRow(
          group: widget.provider.groups[index],
        ),
        itemCount: widget.provider.groups.length,
      ),
    );
  }

  Future<void> _refresh() async {
    await widget.provider.getChatGroup();
  }
}

