import 'package:flutter/material.dart';
import 'package:masterfirebase/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget emailText() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email :', hintText: 'you@email.com'),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'more 6 charecter'),
      obscureText: true,
    );
  }

  Widget singinButton() {
    return RaisedButton(
      child: new Text('Sing In'),
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.pink[200],
      textColor: Colors.white,
    );
  }

  Widget singupButton() {
    return RaisedButton(
      child: new Text('Sing Up'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.pink[400],
      textColor: Colors.white,
    );
  }

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
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.pink], begin: Alignment(-1, -1))),
        // decoration: new BoxDecoration(
        //   image: new DecorationImage(
        //     image: new AssetImage("images/backgrond.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
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
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: emailText(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: passwordText(),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 4.0, right: 4.0),
                            child: singinButton())),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 4.0, right: 4.0),
                            child: singupButton())),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
