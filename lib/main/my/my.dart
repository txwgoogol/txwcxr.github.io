//net
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goc/bean/base/error_bean.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("我的"),
          actions: <Widget>[new Container()],
        ),
        body: new Center(
          child: Profile(),
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileSection createState() => _ProfileSection();
}

class _ProfileSection extends State<Profile> {
  var errorBean;
  var _ipAddress = 'Unknown';

  _getProfile() async {
    var userInfoUri = 'https://zsydian.com/account/getInfo';
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(userInfoUri));
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(Utf8Decoder()).join();
        print("===json==" + json.toString());
        result = json.toString();

        Map jsonMap = jsonDecode(json);
        errorBean = ErrorBean.fromJson(jsonMap);

        print('errorMessage：\n'
            'status：${errorBean.status} \n'
            'errorCode：${errorBean.errorCode} \n'
            'errorMessage：${errorBean.errorMessage}\n');

      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });

  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(
      height: 32.0,
    );
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is: \n $_ipAddress'),
            spacer,
            new RaisedButton(
                child: new Text('get ip address'),
                onPressed: () {
                  _getProfile();
                })
          ],
        ),
      ),
    );
  }
}
