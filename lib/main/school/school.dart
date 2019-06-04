import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("商学院"),
          actions: <Widget>[new Container()],
        ),
        body: new Scaffold(
          body: new FadeAnimal(),
        ),
      ),
    );
  }
}

//动画实现
class FadeAnimal extends StatefulWidget {
  @override
  _FadeSection createState() => _FadeSection();
}

class _FadeSection extends State<FadeAnimal> with TickerProviderStateMixin {
  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _curvedAnimation =
        new CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: _curvedAnimation,
            child: new Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniStartTop,
              body: new IconButton(
                  icon: new Icon(Icons.gesture), onPressed: () => Signature()),
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Fade',
          child: new Icon(Icons.brush),
          onPressed: () => _animationController.forward()),
    );
  }
}


//自定义布局
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {
  @override
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox renderBox = context.findRenderObject();
              Offset _locationPosition =
                  renderBox.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(_locationPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(
            painter: new SignaturePainter(_points),
            size: Size.infinite,
          ),
        ),
      ],
    );
  }
}
