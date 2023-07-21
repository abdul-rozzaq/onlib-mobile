// ignore_for_file: avoid_print

// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:onlib/services/utils.dart';
// import '../config.dart';


import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    return token;
  }

  static Future<bool> setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Token $token");
    return prefs.setString('token', token!);
  }

  static Future clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Token cleaned');
    prefs.remove('token');
  }
}
