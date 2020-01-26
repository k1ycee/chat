import 'package:chat/pages/auth_page/login_page.dart';
import 'package:chat/pages/auth_page/register_page.dart';
import 'package:chat/pages/splash/splashbuttons.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String id = "SPLASH";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat Anonymous", style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w300),),
          centerTitle: true,
          elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AuthButton(
                  text: 'Log In', 
                  callback: () {
                    Navigator.of(context).pushNamed(Login.id);
                    }, 
                  ),
                ],
              ),
            SizedBox(height: 20),
            AuthButton(
              text: 'Register',
              callback: () {
                    Navigator.of(context).pushNamed(Register.id);
              }, 
            ),
         ],
      )
    );
  }
}