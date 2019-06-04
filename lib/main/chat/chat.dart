import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("沟通"),
          actions: <Widget>[new Container()],
        ),
        body: new Container(
          child: new _GestureDetector(),
        ),
      ),
    );
  }
}

class _GestureDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('my button was tapped!');
      },
      child: new Container(
        width: double.infinity,
        height: double.infinity,
//        padding: const EdgeInsets.all(8.0),
//        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new _FlatSection(),
            ),
            new _ButtonSection(),
          ],
        ),
      ),
    );
  }
}

//https://blog.csdn.net/poorkick/article/details/81059149
class _FlatSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return new FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: "ADD",
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          heroTag: "",
          elevation: 7.0,
          highlightElevation: 14.0,
          onPressed: () {
            Scaffold.of(context)
                .showSnackBar(new SnackBar(content: new Text("FAB is click")));
          },
          mini: false,
          shape: new CircleBorder(),
          isExtended: false,
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

//各种button
class _ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new MaterialButton(
            child: new Text('MaterialButton'),
            color: Colors.blue[500],
            textColor: Colors.white,
            onPressed: () {
              final materialButtonSnackBar =
                  SnackBar(content: Text('Yay! A MaterialButton SnackBar!'));
              Scaffold.of(context).showSnackBar(materialButtonSnackBar);
            },
          ),
          new RaisedButton(
              child: new Text('RaisedButton'),
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: () {
                final raisedButtonSnackBar =
                    SnackBar(content: Text('Yay! A RaisedButton SnackBar!'));
                Scaffold.of(context).showSnackBar(raisedButtonSnackBar);
              }),
          new FlatButton(
              child: new Text('FlatButton'),
              onPressed: () {
                final flatButtonSnackBar =
                    SnackBar(content: Text('Yay! A FlatButton SnackBar!'));
                Scaffold.of(context).showSnackBar(flatButtonSnackBar);
              }),
        ],
      ),
    );
  }
}
