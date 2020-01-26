import 'package:chat/pages/chat_area/chat_screen.dart';
import 'package:chat/pages/splash/splashbuttons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  static const String id = "REGISTER";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async{
    AuthResult user = await _auth.createUserWithEmailAndPassword(
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
                  text: 'Register',
                  callback: () async{await registerUser();},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}