// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:onlib/models/message_model.dart';
import 'package:web_socket_channel/io.dart';
import '../config.dart';
import '../models/user_model.dart';
import '../services/prefs.dart';
import '../services/utils.dart';

class ChatScreenVM extends ChangeNotifier {
  TextEditingController inputController = TextEditingController();
  bool isMessagesLoading = true;
  List<Message> messages = [];
  late IOWebSocketChannel channel;

  late User sender;

  void setSender() async {
    sender = await Prefs.getUser();

    
    notifyListeners();
  }

  Future getMessages(String groupId) async {
    try {
      var url = Uri.parse('$domain/api/messages/?group-id=$groupId');
      var token = await Prefs.getUserToken();

      var response =
          await http.get(url, headers: {'Authorization': "Token $token"});

      if (response.statusCode == 200) {
        messages = messagesFromJson(response.body);
   

        notifyListeners();
        print('Messages fetched');
      }
    } on SocketException {
      Utils.showToast('Internet tarmog\'iga ulanmagan bo\'lishi mumkin!');
    } catch (e) {
      print(e);
      Utils.showToast('Nimadur xato ketti.');
    }
  }

  sendMessage() {
    channel.sink.add(jsonEncode({'message': inputController.text}));
    print('Messages sended');
  }

  void clearMessages() {
    isMessagesLoading = true;
    messages = [];
    notifyListeners();

    print('Messages cleaned');
  }

  void initChannel(String id) {
    channel = IOWebSocketChannel.connect('ws://$host/ws/chat/$id/');
    print('init');

    channel.stream.listen(onMessage);
  }

  onMessage(message) {
    print(message);
  }
}
