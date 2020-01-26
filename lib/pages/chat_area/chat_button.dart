import 'package:flutter/material.dart';


class ChatButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const ChatButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(Icons.send),
        onPressed: callback,
        color: Colors.green,
      ),
    );
  }
}