import 'package:chat/pages/auth_page/login_page.dart';
import 'package:chat/pages/auth_page/register_page.dart';
import 'package:chat/pages/chat_area/chat_screen.dart';
import 'package:chat/pages/splash/splash_page.dart';
import 'package:chat/pages/splash/splashbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  static const String id = "LANDING";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Splash.id,
      routes: {
        Splash.id: (context) => Splash(),
        Chat.id: (context) => Chat(),
        Register.id: (context) => Register(),
        Login.id: (context) => Login()
      },
    );
  }
}