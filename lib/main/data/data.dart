import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    var titleTextStyle = new TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.5,
      fontFamily: 'Roboto',
    );

    var subTextStyle = new TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.5,
      fontFamily: 'Roboto',
      height: 2.0,
    );

    //title
    var titleText = new Container(
      child: new Text(
        "Strawberry Pavlova",
        style: titleTextStyle,
      ),
    );

    //sub
    var subText = new Container(
      child: new Text(
        '''
        Pavlova is a meringue-base dessert named after the Russian ballerina Anna Pavlova，Pavlova features a crisp crusl and soft,light inside ,lopped with fruit and whipped cream.
        ''',
        softWrap: true,
        style: subTextStyle,
      ),
    );

    //星星
    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
            ]),
            new Text(
              "170 Reviews",
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 14.0,
              ),
            ),
          ]),
    );

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Icon(
                Icons.kitchen,
                color: Colors.green[500],
              ),
              new Text(
                "PREP:",
                style: subTextStyle,
              ),
              new Text(
                "25 min",
                style: subTextStyle,
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              new Icon(
                Icons.timer,
                color: Colors.green[500],
              ),
              new Text(
                "Cook",
                style: subTextStyle,
              ),
              new Text(
                "1 hr",
                style: subTextStyle,
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              new Icon(
                Icons.restaurant,
                color: Colors.green[500],
              ),
              new Text(
                "FEEDS",
                style: subTextStyle,
              ),
              new Text(
                "4-6",
                style: subTextStyle,
              ),
            ],
          ),
        ],
      ),
    );

    //左边布局
    Widget leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: <Widget>[
          titleText,
          subText,
          ratings,
          buttonSection,
        ],
      ),
    );

    Widget mainImage = new Container(
      child: new Image.network(
        "https://image.shutterstock.com/image-photo/meringue-dessert-pavlova-cake-fresh-260nw-574690444.jpg",
      ),
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("数据"),
          actions: <Widget>[new Container()],
        ),
        body: new Center(
          child: new ListView(

            children: <Widget>[
              mainImage,
              leftColumn,
            ],

            /*
            margin: new EdgeInsets.fromLTRB(0.0, 40, 0.0, 30.0),
            height: 600.0,
            child: new Card(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    width: 440.0,
                    child: leftColumn,
                  ),
                  mainImage,
                ],
              ),
            ),
             */

          ),
        ),
      ),
    );
  }
}
