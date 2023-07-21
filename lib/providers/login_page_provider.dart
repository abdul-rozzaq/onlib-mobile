// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlib/screens/home_screen.dart';
import 'package:onlib/services/prefs.dart';

import '../config.dart';
import '../services/utils.dart';

class LoginPageVM extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController(text: 'admin');
  TextEditingController passwordController = TextEditingController(text: 'admin');

  Future<void> getToken(BuildContext context) async {
    print('Login Clicked');

    try {
      var url = Uri.parse('$domain/api/login/');
      var response = await http.post(url, body: {
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim(),
      });

      Map jsonData = jsonDecode(response.body);
      print(jsonData);

      if (response.statusCode == 200) {
        String key = jsonData['token'];

        print(key);
        Prefs.setToken(key);

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (builder) => const HomeScreen(),
          ),
          (route) => false,
        );
      } else {
        Utils.showBottomToast('User not found');
        Navigator.of(context).pop();
      }

      // String token = response.body;
    } on SocketException {
      Utils.showToast('Internet tarmog\'iga ulanmagan bo\'lishi mumkin!');
    } catch (e) {
      print(e);
      Utils.showToast('Nimadur xato ketti.');
    }
  }
}
