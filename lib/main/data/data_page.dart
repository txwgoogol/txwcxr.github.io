import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPage createState() => _DataPage();
}

class _DataPage extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Container(
        child: new Center(
          child: new Text("数据"),
        ),
      ),
    );
  }
}
