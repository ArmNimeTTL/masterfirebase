import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showAppName() {
    return Text(
      'Master Rose',
      style: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.pink[200]),
    );
  }

  Widget showLogo() {
    return Image.asset('images/rose.gif');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [Colors.black, Colors.pink],begin: Alignment(-1, -1))),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/backgrond.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 100.0),
        alignment: Alignment(0, -1),
        child: Column(
          children: <Widget>[
            Container(
              width: 300.0,
              height: 200.0,
              child: showLogo(),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: showAppName(),
            )
          ],
        ),
      ),
    );
  }
}
