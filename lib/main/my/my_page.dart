import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage> {

  var responseJson;

  @override
  Widget build(BuildContext context) {
    //获取用户信息
    _userInfo() async {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse(""));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(Utf8Decoder()).join();
        var data = json.decode(responseBody);
        responseJson = data;
        print("data=========" + data);
      }
    }

    return new MaterialApp(
      home: new Container(
        child: new Center(
          child: new Text("我的"),
        ),
      ),
    );
  }
}
