// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlib/config.dart';
import 'package:onlib/models/book_model.dart';
import 'package:onlib/models/category_model.dart';
import 'package:onlib/models/user_model.dart';
import 'package:onlib/screens/login_screen.dart';

import '../services/prefs.dart';
import '../services/utils.dart';

class HomePageVM extends ChangeNotifier {
  bool isLoadingCategory = true;
  bool isLoadingUser = true;
  bool isLoadingBook = true;

  int index = 0;

  List<Category> categories = [];
  
  User? user;
  List<Book> books = [];

  Future getUser(BuildContext context) async {
    try {
      var url = Uri.parse('$domain/api/user/');
      var token = await Prefs.getUserToken();

      var response =
          await http.get(url, headers: {'Authorization': "Token $token"});

      print(response.statusCode);
      if (response.statusCode == 200) {
        user = userFromJson(response.body);
        print('User fetched');

        isLoadingUser = false;
        notifyListeners();
      } else {
        Prefs.clearToken();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
          (route) => false,
        );
      }
    } on SocketException {
      Utils.showToast('Internet tarmog\'iga ulanmagan bo\'lishi mumkin!');
    } catch (e) {
      print(e);
      Utils.showToast('Nimadur xato ketti.');
    }
  }

  Future logoutUser() async {
    Prefs.clearToken();
    // try {
    //   var url = Uri.parse('$domain/api-auth/logout/');
    //   var token = await Prefs.getUserToken();

    //   var response =
    //       await http.post(url, headers: {'Authorization': "Token $token"});

    //   if (response.statusCode == 200) {
    //     print('User logout');
    //   }
    // } on SocketException {
    //   Utils.showToast('Internet tarmog\'iga ulanmagan bo\'lishi mumkin!');
    // } catch (e) {
    //   print(e);
    //   Utils.showToast('Nimadur xato ketti.');
    // }
  }

  Future getCategories() async {
    try {
      var url = Uri.parse('$domain/api/categories/');
      var token = await Prefs.getUserToken();

      var response =
          await http.get(url, headers: {'Authorization': "Token $token"});
      if (response.statusCode == 200) {
        categories = categoryFromJson(response.body);
        print('Categories fetched');

        isLoadingCategory = false;
        notifyListeners();
      }
    } on SocketException {
      Utils.showToast('Internet tarmog\'iga ulanmagan bo\'lishi mumkin!');
    } catch (e) {
      print(e);
      Utils.showToast('Nimadur xato ketti.');
    }
  }

  Future getBooks() async {
    try {
      var url = Uri.parse('$domain/api/books/');
      var token = await Prefs.getUserToken();

      var response =
          await http.get(url, headers: {'Authorization': "Token $token"});

      if (response.statusCode == 200) {
        books = booksFromJson(response.body);
        print('Books fetched');

        isLoadingBook = false;
        notifyListeners();
      }
    } on SocketException {
      Utils.showToast('Internet tarmog\'iga ulanmagan bo\'lishi mumkin!');
    } catch (e) {
      print(e);
      Utils.showToast('Nimadur xato ketti.');
    }
  }

  void updateIndex(x) {
    index = x;
    notifyListeners();
  }
}
