import 'package:chat/pages/chat_area/chat_button.dart';
import 'package:chat/pages/chat_area/message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chat extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const Chat({Key key, this.user}) : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> paddyme()async{
    if (messageController.text.length > 0){
      await _firestore.collection('message').add({
        'text': messageController.text,
        'from':widget.user.email,
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.bounceIn,
        duration: Duration(microseconds: 500)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) 
                  return Center(
                    child: SpinKitFadingCircle(
                      color: Colors.green,
                      size: 50)
                  );
                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  List<Widget> messages = docs.map((doc) => Message(
                    from: doc.data['from'],
                    text: doc.data['text'],
                    me: widget.user.email == doc.data['from'] ?? 'null',
                  )).toList();
                  return ListView(
                    controller: scrollController,
                    children: <Widget>[
                      ...messages,
                    ],
                  );
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => paddyme(),
                      autocorrect: true,
                      controller: messageController,
                      decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: const OutlineInputBorder(),
                  ),
                  ),
                  ),
                  ChatButton(
                    text: 'Send',
                    callback: paddyme,
                  )
                ],
                ),
            )
          ],
        ),
      ),
    );
  }
}