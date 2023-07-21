// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key, required this.controller, required this.placeholder});

  final TextEditingController controller;
  final String placeholder;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      obscureText = widget.placeholder == 'Password';
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: width * .85,
      child: CupertinoTextField(
        placeholderStyle:
            const TextStyle(fontFamily: 'Lobster', color: Colors.black45),
        placeholder: widget.placeholder,
        controller: widget.controller,
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(13),
        obscureText: obscureText,
        suffix: widget.placeholder == 'Password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon:
                    const Icon(CupertinoIcons.eye_solid, color: Colors.black38),
              )
            : null,
      ),
    );
  }
}

class AuthBtn extends StatefulWidget {
  AuthBtn({super.key, required this.onTap, required this.text});

  GestureTapCallback? onTap;
  String text;

  @override
  State<AuthBtn> createState() => _AuthBtnState();
}

class _AuthBtnState extends State<AuthBtn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: greenColor,
        ),
        padding: const EdgeInsets.all(13),
        width: size.width * .85,
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Lobster'),
          ),
        ),
      ),
    );
  }
}
