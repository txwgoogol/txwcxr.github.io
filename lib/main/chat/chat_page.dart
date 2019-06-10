import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Container(
        child: new Center(
          child: new Text("沟通"),
        ),
      ),
    );
  }
}
