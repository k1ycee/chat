import 'package:flutter/material.dart';


class AuthButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const AuthButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.green,
        child: MaterialButton(
          onPressed: callback,
          minWidth: 100,
          height: 50.0,
          child: Text(text),
        ),
      ),
    );
  }
}