import 'package:chat/pages/chat_area/chat_screen.dart';
import 'package:chat/pages/splash/splashbuttons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  static const String id = "LOG IN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async{
    AuthResult user = await _auth.signInWithEmailAndPassword(
      email: email, 
      password: password);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Container(
            color: Colors.transparent,
            height: 400,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => email = value,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    border: const OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    border: const OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                AuthButton(
                  text: 'Log In',
                  callback: () async{await loginUser();},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}