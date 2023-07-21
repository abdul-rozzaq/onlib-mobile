// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/providers/register_page_provider.dart';
import 'package:onlib/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/auth_components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<RegPageVM>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final RegPageVM provider = Provider.of<RegPageVM>(context, listen: true);
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
                  TextSpan(text: 'Welcome to '),
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
              controller: provider.firstNameController,
              placeholder: 'First name',
            ),
            InputField(
              controller: provider.lastNameController,
              placeholder: 'Last name',
            ),
            InputField(
              controller: provider.passwordController,
              placeholder: 'Password',
            ),
            const SizedBox(height: 25),
            AuthBtn(
              onTap: () => _register(context, provider),
              text: 'Register',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
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
                        builder: (_) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Login',
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

  void _register(BuildContext context, RegPageVM provider) {
    FocusScope.of(context).unfocus();

    if (provider.usernameController.text.isNotEmpty &&
        provider.passwordController.text.isNotEmpty) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: greenColor,
          ),
        ),
      );
      provider.registerUser(context);
    }
  }
}
