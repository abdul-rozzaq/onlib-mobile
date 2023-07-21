// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/providers/homepage_provider.dart';
import 'package:onlib/screens/login_screen.dart';

class AccountTab extends StatelessWidget {
  AccountTab({super.key, required this.provider});

  HomePageVM provider;

  @override
  Widget build(BuildContext context) {
    return !provider.isLoadingUser
        ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(provider.user!.id.toString()),
                Text(provider.user!.username),
                Text(provider.user!.firstName),
                Text(provider.user!.lastName),
                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    provider.logoutUser();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text('Logout'),
                )
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(color: greenColor),
          );
  }
}
