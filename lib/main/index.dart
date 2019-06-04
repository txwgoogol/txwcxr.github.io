import 'package:flutter/material.dart';

import 'package:goc/widget/navigation.dart';
import 'package:goc/main/home/home.dart';
import 'package:goc/main/data/data.dart';
import 'package:goc/main/chat/chat.dart';
import 'package:goc/main/school/school.dart';
import 'package:goc/main/my/my.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0; //当前页面索引
  List<NavigationIconView> _navigationIconViews; //底部图片按钮区域
  List<StatefulWidget> _pageList; //存放对应的页面
  StatefulWidget _currentPage; //当前显示页面

  //空的设置状态的方法
  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _navigationIconViews = <NavigationIconView>[
      new NavigationIconView(
          icon: new Icon(Icons.home), title: new Text("首页"), vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.data_usage), title: new Text("数据"), vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.chat_bubble_outline),
          title: new Text("沟通"),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.school), title: new Text("商学院"), vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.person_outline),
          title: new Text("我的"),
          vsync: this),
    ];

    for (NavigationIconView view in _navigationIconViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new HomePage(),
      new DataPage(),
      new ChatPage(),
      new SchoolPage(),
      new MyPage(),
    ];

    _currentPage = _pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationIconViews
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _navigationIconViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationIconViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

}
