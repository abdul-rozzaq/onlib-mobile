
// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

import '../config.dart';

class Category extends StatelessWidget {
  Category(
      {super.key,
      required this.type,
      required this.updateCategory,
      required this.selectedCategory});

  var selectedCategory;
  final String type;
  var updateCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateCategory(type);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: selectedCategory != type ? Colors.black12 : greenColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: selectedCategory != type ? blackColor : Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
      ),
    );
  }
}
