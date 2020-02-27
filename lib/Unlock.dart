import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:testing_app/main.dart';

class Unlock extends StatefulWidget {
  String orderNo;
  Unlock(this.orderNo);
  @override
  UnlockState createState() => UnlockState(this.orderNo);
}

class UnlockState extends State<Unlock> with TickerProviderStateMixin {
  String orderNo;
  UnlockState(this.orderNo);
  AnimationController controller;

  // bool isPlaying = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var randomGenerator = math.Random();
    String buttonResend = 'GET CODE';
    String code;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "UNLOCK",
              style: TextStyle(
                  color: Colors.teal[50], fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.teal[300],
        ),
        backgroundColor: Colors.blueGrey[50],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.teal[300]),
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "Shipment No. ${this.orderNo} \n is Ready to Deliver",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 140.0,
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(100.0),
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.grey,
                              color: Colors.black,
                            ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: TextStyle(
                                        fontSize: 55.0, color: Colors.black),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Center(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget child) {
                          return Text(
                            controller.isAnimating
                                ? "The Code is $code"
                                : buttonResend,
                            style: TextStyle(fontSize: 18),
                          );
                        },
                      ),
                    ),
                    color: Colors.lightBlue,
                    onPressed: () {
                      // setState(() => isPlaying = !isPlaying);
                      if (!controller.isAnimating) {
                        code =
                            "${randomGenerator.nextInt(10)}${randomGenerator.nextInt(10)}${randomGenerator.nextInt(10)}${randomGenerator.nextInt(10)}";

                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                        buttonResend = 'RESEND CODE';
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Align(
          child: IconButton(
            icon: Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => My()));
            },
          ),
          alignment: Alignment(-0.85, -0.85),
        ),
      ),
      theme: ThemeData(
        canvasColor: Colors.blueGrey,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        accentColor: Colors.pinkAccent,
        brightness: Brightness.dark,
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
