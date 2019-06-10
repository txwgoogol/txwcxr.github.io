import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  @override
  _SchoolPage createState() => _SchoolPage();
}

class _SchoolPage extends State<SchoolPage> {
  List list = new List();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    await Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        list = List.generate(12, (i) => '原始数据$i');
      });
    });
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(
      title: Text(list[index]),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(new Duration(seconds: 2), () {
      print("=========refresh=========");
      setState(() {
        list = List.generate(20, (i) => "刷新的数据$i");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    return new Scaffold(
//
//      appBar: new AppBar(
//        title: Text("商学院"),
//      ),
//
//      body: RefreshIndicator(
//          child: ListView.builder(
//            itemBuilder: _renderRow,
//            itemCount: list.length,
//          ),
//          onRefresh: _onRefresh),
//    );
    return new MaterialApp(
      home: new Container(
        child: new Center(
          child: new Text("商学院"),
        ),
      ),
    );
  }

}