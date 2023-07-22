// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/providers/login_page_provider.dart';
import 'package:onlib/screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/auth_components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<LoginPageVM>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final LoginPageVM provider =
        Provider.of<LoginPageVM>(context, listen: true);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        width: size.width,
        // decoration: BoxDecoration(color: greenColor),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/lock.png'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: 25,
                ),
                children: [
                  TextSpan(text: 'Welcome back to '),
                  TextSpan(
                    text: 'OnLib',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const Text(
              'Keep your data safe!',
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Lobster',
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 35),
            InputField(
              controller: provider.usernameController,
              placeholder: 'Username',
            ),
            InputField(
              controller: provider.passwordController,
              placeholder: 'Password',
            ),
            const SizedBox(height: 25),
            AuthBtn(onTap: () => _login(context, provider), text: 'Login'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 18,
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            const SizedBox(height: 70),
          ]),
        ),
      ),
    );
  }

  void _login(BuildContext context, LoginPageVM provider) {
    FocusScope.of(context).unfocus();

    if (provider.usernameController.text.isNotEmpty &&
        provider.passwordController.text.isNotEmpty) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            color: greenColor,
          ),
        ),
      );
      provider.getToken(context);
    }
  }
}
