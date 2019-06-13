import 'package:flutter/material.dart';
import 'package:flutter_app/main/index.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Index(),
    );
  }
}
