import 'package:flutter/material.dart';

import 'package:goc/main/index.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Index()
    );
  }
}


/*
new Scaffold(
        appBar: new AppBar(
            title: new Text("启动页"), actions: <Widget>[new Container()]),
        body: new Center(
          child: new Text("启动页"),
        ),
      ),
      //静态路由 跳转到主页
      routes: <String, WidgetBuilder>{'': (BuildContext context) => Index()},
 */