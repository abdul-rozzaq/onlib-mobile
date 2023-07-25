// ignore_for_file: avoid_print, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:onlib/providers/chat_provider.dart';
import 'package:onlib/providers/register_page_provider.dart';
import 'package:onlib/services/prefs.dart';
import 'package:onlib/providers/homepage_provider.dart';
import 'package:onlib/providers/login_page_provider.dart';
import 'package:onlib/screens/home_screen.dart';
import 'package:onlib/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'config.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageVM()),
        ChangeNotifierProvider(create: (_) => LoginPageVM()),
        ChangeNotifierProvider(create: (_) => RegPageVM()),
        ChangeNotifierProvider(create: (_) => ChatScreenVM()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Prefs.getUserToken(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            FlutterNativeSplash.remove();

            if (snapshot.hasData) {
              final data = snapshot.data as String;
              print(data);

              return const HomeScreen();
            } else {
              print('Login screen');
              return const LoginScreen();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
