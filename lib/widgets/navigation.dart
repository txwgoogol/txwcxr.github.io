import 'package:flutter/material.dart';

class NavigationIconView {

  //展示icon
  final BottomNavigationBarItem item;
  //动画处理
  final AnimationController controller;

  // icon 图标， title 标题，
  NavigationIconView({Widget icon, Widget title, TickerProvider vsync}):

        item = new BottomNavigationBarItem(icon: icon,title: title),
        controller = new AnimationController(
            duration:kThemeAnimationDuration, //设置动画持续时间
            vsync: vsync //默认属性和参数
        );

}