import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    HelloFlutterWidget(),
  );
}

class HelloFlutterWidget extends StatefulWidget {
  @override
  _HelloFlutterWidgetState createState() => _HelloFlutterWidgetState();
}

class _HelloFlutterWidgetState extends State<HelloFlutterWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Color _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: GestureDetector(
          onTap: () {
            setState(() {
              _backgroundColor = getRandomColor();
            });
            final snackBar = SnackBar(
              content: Text("Background color changed"),
              duration: Duration(seconds: 1),
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          },
          child: WelcomePageWidget(backgroundColor: _backgroundColor),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);
  double opacity = random.nextDouble();
  return Color.fromRGBO(red, green, blue, opacity);
}

class WelcomePageWidget extends StatelessWidget {
  final Color _backgroundColor;

  const WelcomePageWidget({Key key, @required Color backgroundColor})
      : _backgroundColor = backgroundColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('Hello from my first Flutter app'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[600],
      ),
      body: GreetingWidget(),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hey there',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.green[800],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
