import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade400,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  static void showBottomToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade400,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
