import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Container(
        child: new Center(
          child: new Text("首页"),
        ),
      ),
    );
  }
}
