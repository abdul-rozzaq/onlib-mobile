// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlib/screens/home_screen.dart';
import 'package:onlib/services/prefs.dart';

import '../config.dart';
import '../services/utils.dart';

class RegPageVM extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
    print('Register clicked');

    try {
      var url = Uri.parse('$domain/api/register/');
      var response = await http.post(url, body: {
        'username': usernameController.text.trim(),
        'first_name': firstNameController.text.trim(),
        'last_name': lastNameController.text.trim(),
        'password': passwordController.text.trim(),
      });

      Map jsonData = jsonDecode(response.body);

      print(jsonData);

      if (response.statusCode == 200) {
        String token = jsonData['token'];

        print(token);
        Prefs.setToken(token);

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
    } on SocketException {
      Utils.showToast('Internet tarmog\'iga ulanmagan bo\'lishi mumkin!');
    } catch (e) {
      print(e);
      Utils.showToast('Nimadur xato ketti.');
    }
  }
}
