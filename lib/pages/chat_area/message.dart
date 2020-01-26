import 'package:flutter/material.dart';


class Message extends StatelessWidget {
  
  final String from;
  final String text;
  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: me ? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from
          ),
          Material(
            color: me ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text
              ),
            ),
          )
        ],
      ) 
    );
  }
}